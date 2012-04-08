ActiveAdmin.register AdminUser do

  scope :teachers, :default => true
  scope :admins

  menu :if => proc { can? :manage, AdminUser }, :label => 'Teachers/Admins'
  controller.authorize_resource

  index do
    column :name
    column :email
    column :admin_role
    column :last_sign_in_at
    column :last_sign_in_ip
    default_actions
  end

  show do |admin|
    attributes_table do
      row :name
      row :email
      row :admin_role
      row :last_sign_in_at
      row :last_sign_in_ip
    end
  end
 
  form do |f|
    f.inputs do
      f.input :name, :label => 'Full name'
      f.input :email, :input_html => { :disabled => f.object.persisted? }
      f.input :admin_role
    end
    f.buttons
  end

  filter :name
  filter :admin_role
  filter :email
  
end
