class Student < ActiveRecord::Base

  authenticates_with_sorcery!

  attr_accessible :email, :first_name, :last_name, :username, :birthday, :group_id, :group, :password, :password_confirmation
  #hash_keys :first_name, :last_name, :email

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, :username, :presence => true, :uniqueness => true

  belongs_to :group
  has_one :schedule, :through => :group
  has_many :lessons

  before_validation :setup_username, :on => :create

  def name
    "#{first_name} #{last_name}" if first_name.presence
  end

  private 

  def setup_username
    self.username ||= self.email.split('@').first
  end

end
