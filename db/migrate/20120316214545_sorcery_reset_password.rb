class SorceryResetPassword < ActiveRecord::Migration
  def self.up
    add_column :students, :reset_password_token, :string, :default => nil
    add_column :students, :reset_password_token_expires_at, :datetime, :default => nil
    add_column :students, :reset_password_email_sent_at, :datetime, :default => nil
    
    add_index :students, :reset_password_token
  end

  def self.down
    remove_index :students, :reset_password_token
    
    remove_column :students, :reset_password_email_sent_at
    remove_column :students, :reset_password_token_expires_at
    remove_column :students, :reset_password_token
  end
end