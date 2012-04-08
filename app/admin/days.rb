ActiveAdmin.register Day do

  controller.authorize_resource

  menu false

  show do
    attributes_table do
      row :name
      row :schedule
    end
  end

end
