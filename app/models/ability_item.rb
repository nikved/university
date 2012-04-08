class AbilityItem < ActiveRecord::Base

  validates_presence_of :data

  has_and_belongs_to_many :admin_roles
  
  def name; data; end

end
