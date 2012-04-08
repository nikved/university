class AddNumberToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :number, :integer

  end
end
