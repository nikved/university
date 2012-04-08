class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.integer :day_id
      t.string :time
      t.boolean :lecture
      t.string :room
      t.text :notes

      t.timestamps
    end
  end
end
