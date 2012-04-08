class AddFacultyToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :faculty_id, :integer

  end
end
