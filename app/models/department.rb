class Department < ActiveRecord::Base

  has_many :groups
  belongs_to :faculty

  validates_presence_of :faculty
  validates :name, :presence => true, :uniqueness => { :case_sensitive => false }

end
