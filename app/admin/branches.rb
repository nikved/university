ActiveAdmin.register Branch do

  menu :if => proc { can? :manage, Branch }
  controller.authorize_resource

  scope(:all, :default => true) { |dep| dep.includes :faculty }

  index do
    column :name
    column :faculty, :sortable => 'faculties.name'
    column(:description) { |faculty| faculty.description.truncate 100 }
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :faculty
      row :description
    end
  end

  form do |f|
    f.inputs do
      f.input :faculty
      f.input :name
      f.input :description
    end
    f.buttons
  end

end
