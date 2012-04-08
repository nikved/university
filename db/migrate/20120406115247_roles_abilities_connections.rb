class RolesAbilitiesConnections < ActiveRecord::Migration
  def change
    create_table :ability_items_admin_roles, :id => false do |t|
      t.integer :ability_item_id
      t.integer :admin_role_id
    end
  end
end
