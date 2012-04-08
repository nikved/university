class AddGroupToExam < ActiveRecord::Migration
  def change
    add_column :exams, :group_id, :integer

  end
end
