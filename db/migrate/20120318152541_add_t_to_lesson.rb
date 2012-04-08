class AddTToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :t, :time

  end
end
