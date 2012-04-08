class AddDataToAbilityItem < ActiveRecord::Migration
  def change
    add_column :ability_items, :data, :string

  end
end
