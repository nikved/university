class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.time :datetime
      t.integer :teacher_id
      t.integer :lesson_id
      t.string :room
      t.text :notes

      t.timestamps
    end
  end
end
