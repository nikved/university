class RemoveNFromDay < ActiveRecord::Migration
  def change
    remove_column :days, :n
  end
end
