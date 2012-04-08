class AddPersonalDataToStudent < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
    end

  end
end
