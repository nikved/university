class CreateAbilityItems < ActiveRecord::Migration
  def change
    create_table :ability_items do |t|

      t.timestamps
    end
  end
end
