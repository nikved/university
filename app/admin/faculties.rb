ActiveAdmin.register Faculty do

  menu :if => proc { can? :manage, Faculty }
  controller.authorize_resource

  index do
    column :name
    column(:description) { |faculty| faculty.description.truncate 100 }
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :description
    end
  end

end
