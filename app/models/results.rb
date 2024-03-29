module Results
  module Helper
    def get_key(model)
      "#{model.class.model_name.downcase}_#{model.id}"
    end

    def get_model(key)
      model, id = key.split('_')
      model.camelize.constantize.find(id)
    end

    def recommendations_for?(model)
      !recommendations_for(model).empty?
    end

    def recommendations_for(model)
      r = Hash.new
      values.each do |item|
        item.recommendations_for(model).each_pair do |key, value|
          r[key] ||= Array.new
          r[key] += value
          r[key].uniq!
        end
      end
      r.default = []
      r
    end
  end

  module CategoriesMethods
    include(Helper)

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

    def any?
      values.inject(false) { |r, category| r || category.any? }
    end
  end

  module CategoryMethods
    include(Helper)

    def percentual
      any? ? values.max_by { |item| item.percentual }.percentual : 0
    end

    def to_s
      str = String.new
      each_pair do |key, value|
        str += "    #{key}: #{value.percentual}\n"
        str += value.to_s
      end
      str
    end
  end

  module ItemMethods
    include(Helper)
    include(ActionView::Helpers::NumberHelper)

    def messages
      self[percentual]
    end

    def percentual
      keys.max
    end

    def recommendations_for(model)
      r = Hash.new
      messages.find_all { |m| m[:instance] == get_key(model) }.each do |m|
        m[:attributes].each do |a|
          r[a] ||= Array.new
          r[a] << "#{m[:message]} (+#{number_to_percentage percentual, precision: 2})"
        end
      end
      r
    end

    def to_s
      str = String.new
      messages.each do |message|
        str += "      * #{message[:message]}\n"
        str += "        Highlight #{message[:attributes]} "
        str += "of #{get_model(message[:instance]).name}\n"
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
      @current_item = @current_category["#{item.name}"] ||= Hash.new
      @current_item.extend(ItemMethods)
      yield(item)
      @current_category.delete("#{item.name}") if @current_item.empty?
    end
  end

  def with_percentual(value, &block)
    @current_value = @current_item[value] ||= Array.new
    yield
  end

  def recommend(message)
    @current_value << {
      message: message, attributes: nil, instance: nil
    }
  end

  def for_attributes(*attributes)
    @current_value.last[:attributes] = attributes
  end

  def of(instance)
    @current_value.last[:instance] = "#{get_key(instance)}"
  end

  def recommendations_for(model)
    results.recommendations_for(model)
  end

  def recommendations
    recommendations_for(self)
  end
end