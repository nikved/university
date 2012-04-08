class Faculty < ActiveRecord::Base

  has_many :groups
  has_many :departments
  has_many :branches

  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }

end
