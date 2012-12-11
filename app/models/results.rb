module Results
  module Helper
    def to_key(model)
      "#{model.class.model_name}_#{model.id}"
    end

    def to_model(key)
      model, id = key.split('_')
      model.constantize.find(id)
    end

    def recommendations_for?(model)
      !recommendations_for(model).empty?
    end
  end

  module CategoriesMethods
    C = 0.5

    def percentual
      C * values.inject(0) { |sum, category| sum + category.percentual }
    end

    def to_s
      str = "Results: #{percentual} using C = #{C}\n"
      each_pair do |key, value|
        str += "  #{key.to_s.humanize}: #{value.percentual}\n"
        str += value.to_s
      end

      str
    end

    def recommendations_for(model)
      values.inject([]) { |memo, item| memo + item.recommendations_for(model) }
    end
  end

  module CategoryMethods
    include(Helper)

    def percentual
      values.max_by { |item| item.percentual }.percentual
    end

    def recommendations_for(model)
      values.inject([]) { |memo, item| memo + item.recommendations_for(model) }
    end

    def to_s
      str = String.new
      each_pair do |key, value|
        str += "    #{to_model(key).name}: #{value.percentual}\n"
        str += value.to_s
      end
      str
    end
  end

  module ItemMethods
    include(Helper)

    def messages
      self[percentual]
    end

    def percentual
      keys.max
    end

    def recommendations_for(model)
      messages.find_all { |message| message[:instance] == to_key(model) }
    end

    def to_s
      str = String.new
      messages.each do |message|
        str += "      * #{message[:message]}\n"
        str += "        Highlight #{message[:attributes]} "
        str += "of #{to_model(message[:instance]).name}\n"
      end
      str
    end
  end

  include(Helper)

  def generate_results_for(category, &block)
    @categories ||= Hash.new
    @categories.extend(CategoriesMethods)

    @current_category = @categories[category] ||= Hash.new
    @current_category.extend(CategoryMethods)
    yield
    @categories
  end

  def for_each_item_in(collection, &block)
    self.send(collection).each do |item|
      @current_item = @current_category["#{to_key(item)}"] ||= Hash.new
      @current_item.extend(ItemMethods)
      yield(item)
    end
  end

  def with_percentual(value, &block)
    @current_value = @current_item[value] ||= Array.new
    yield
  end

  def recommend(message)
    @current_value << { message: message, attributes: nil, instance: nil }
  end

  def for_attributes(*attributes)
    @current_value.last[:attributes] = attributes
  end

  def of(instance)
    @current_value.last[:instance] = "#{to_key(instance)}"
  end
end