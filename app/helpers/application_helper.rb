module ApplicationHelper
  def link_to_destroy(object)
    path = send("#{controller_name.singularize}_url", object)
    button_to "Destroy", path, 
              method: :delete, 
              data: { confirm: "Are you sure?" }, 
              form_class: "confirm_destroy", 
              class: "destroy_icon"
  end
end
