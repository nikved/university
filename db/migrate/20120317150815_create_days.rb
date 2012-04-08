class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :n
      t.integer :schedule_id

      t.timestamps
    end
  end
end
