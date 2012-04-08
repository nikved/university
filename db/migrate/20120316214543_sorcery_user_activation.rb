class SorceryUserActivation < ActiveRecord::Migration
  def self.up
    add_column :students, :activation_state, :string, :default => nil
    add_column :students, :activation_token, :string, :default => nil
    add_column :students, :activation_token_expires_at, :datetime, :default => nil
    
    add_index :students, :activation_token
  end

  def self.down
    remove_index :students, :activation_token
    
    remove_column :students, :activation_token_expires_at
    remove_column :students, :activation_token
    remove_column :students, :activation_state
  end
end