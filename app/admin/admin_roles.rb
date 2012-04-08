ActiveAdmin.register AdminRole do

  menu :if => proc { can? :manage, AdminRole }
  controller.authorize_resource

  show do |role|
    attributes_table do
      row :name
      row(:items) do |role|
        table_for role.ability_items do
          column :name
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :ability_items, :as => :check_boxes
    end
    f.buttons
  end
 
end
