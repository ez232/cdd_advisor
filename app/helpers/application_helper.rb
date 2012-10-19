module ApplicationHelper
  def link_to_function(name, function, html_options={})
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    content_tag(:a, name, html_options.merge(href: href,
                onclick: onclick))
  end

  def link_to_remove_fields(name, f, show = true)
    # TODO: review this deprecated function
    f.hidden_field(:_destroy) + link_to_function(name,
      "remove_fields(this, #{show})")
  end

  def link_to_add_fields(name, f, association, visible, hide = true)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
                          child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    style = "display:none;" unless visible

    link_to_function(name,
      "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", #{hide})",
      style: style)
  end
end