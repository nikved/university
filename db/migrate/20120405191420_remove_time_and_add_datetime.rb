class RemoveTimeAndAddDatetime < ActiveRecord::Migration
  def up
    remove_column :exams, :datetime
    add_column :exams, :time, :datetime
  end

  def down
    remove_column :exams, :time
    add_column :exams, :datetime, :time
  end
end
