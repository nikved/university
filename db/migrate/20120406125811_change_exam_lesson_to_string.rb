class ChangeExamLessonToString < ActiveRecord::Migration
  def up
    remove_column :exams, :lesson_id
    add_column :exams, :lesson, :string
  end

  def down
    remove_column :exams, :lesson
    add_column :exams, :lesson_id, :integer
  end
end
