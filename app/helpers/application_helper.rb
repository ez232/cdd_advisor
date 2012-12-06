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
    if model.errors[field].any?
      error_class = 'error'
      error_message = model.errors[field].first
    end

    label_for = "#{model.class.name.downcase}_#{field}"

    content_tag(:div, class: "control-group #{error_class}") do
      label_tag(label_for, t(".#{field}"), class: 'control-label') <<
      content_tag(:div, class: 'controls') do
        yield << tb_span(error_message, 'help-inline')
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

  private
  def tb_span(value, html_class)
    value ? content_tag(:span, value, class: html_class) : ''
  end
end
