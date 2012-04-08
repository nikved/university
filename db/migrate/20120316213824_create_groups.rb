class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :faculty_id
      t.integer :branch_id
      t.integer :department_id

      t.timestamps
    end
  end
end
