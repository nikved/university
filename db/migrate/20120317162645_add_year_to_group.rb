class AddYearToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :start_year, :integer

  end
end
