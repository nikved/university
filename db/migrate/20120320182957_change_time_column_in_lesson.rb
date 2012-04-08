class ChangeTimeColumnInLesson < ActiveRecord::Migration
  def up
    remove_column :lessons, :t
    remove_column :lessons, :time
    add_column :lessons, :time, :time
  end

  def down
    remove_column :lessons, :time
    add_column :lessons, :t, :time
    add_column :lessons, :string
  end
end
