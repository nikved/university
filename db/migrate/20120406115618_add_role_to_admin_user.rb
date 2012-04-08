class AddRoleToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin_role_id, :integer

  end
end
