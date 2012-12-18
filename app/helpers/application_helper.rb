module ApplicationHelper
  def content_for_breadcrumb
    items = url_for.split('/')[1..-1]
    items.delete_at(-1) if items[-1] == 'edit'

    buffer = ActiveSupport::SafeBuffer.new
    content_for(:breadcrumb) do
      items.each_with_index do |item, i|
        buffer << if item.to_i.zero?
          content_from(items, item, i, item.titlecase)
        else
          model_name = items[i - 1].singularize
          model = instance_variable_get("@#{model_name}")

          content_from(items, item, i, "#{model_name.titlecase}: #{model.name}")
        end
      end
      buffer
    end
  end

  def path_from(items, index)
    "/" + items[0..index].join("/") + "#{'/edit' unless items[index].to_i.zero?}"
  end

  def content_from(items, item, index, content)
    if index == (items.size - 1)
      content_tag(:li, content, class: 'active')
    else
      content_tag(:li) do
        content_tag(:a, content, href: "#{path_from(items, index)}") <<
        content_tag(:span, '/', class: 'divider')
      end
    end
  end

  def tb_form_wrapper(model, field)
    highlight_class, highlight_messages = highlight(model, field)
    label_for = "#{model.class.name.downcase}_#{field}"

    content_tag(:div, class: "control-group #{highlight_class}") do
      label_tag(label_for, t(".#{field}"), class: 'control-label') <<
      content_tag(:div, class: 'controls') do
        yield << tb_highlight(highlight_messages, 'help-inline')
      end
    end
  end

  def tb_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip Devise :timeout flag
      next if type == :timeout
      type = :success if type == :notice
      type = :error if type == :alert
      text = content_tag(:div,
                         content_tag(:button,
                                     raw('&times;'),
                                     class: 'close',
                                     'data-dismiss' => 'alert') + message,
                         class: "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join('\n').html_safe
  end

  def tb_file_upload(form)
    build.hidden_field :name
  end

  def tb_colorpicker(model, field, form)
    color = !model.send(field) ? 'rgb(255, 255, 255)' : model.send(field)
    text_field = form.text_field(field,
                                 :class => 'input-medium cp',
                                 'data-color-format' => 'rgb')
    span = content_tag(:span, :class => 'add-on') do
      content_tag(:i, nil, :style => "background-color: #{color};")
    end

    content_tag(:div, :class => 'input-append color', 'data-color' => color) do
      text_field << span
    end
  end

  private
    def tb_highlight(values, html_class)
      content_tag(:small) do
        content_tag(:ul, class: html_class) do
          values.collect do |value|
            content_tag(:li, value)
          end.join.html_safe
        end
      end if values
    end

    def highlight(model, field)
      if model.errors[field].any?
        highlight_class = 'error'
        highlight_messages = model.errors[field]
      elsif url_for =~ /recommendations$/
        if model.recommendations[field].any?
          highlight_class = 'warning'
          highlight_messages = model.recommendations[field]
        elsif [:grips, :fake_grips].include? field
          if recommendations_for_grips(model).any?
            highlight_class = 'warning'
            highlight_messages = recommendations_for_grips(model)
          end
        end
      end

      [ highlight_class, highlight_messages ]
    end

    def recommendations_for_grips(model)
      [
        :cylindrical_grip, :disc_grip, :disc_grip_2, :flat_hand_push,
        :hook_grip, :one_finger_press, :pinch_grip, :pinch_grip_2, :power_grip,
        :span_grip, :spherical_grip, :thumb_press, :two_fingers_press
      ].collect { |grip| model.recommendations[grip] }.flatten.uniq
    end
end
