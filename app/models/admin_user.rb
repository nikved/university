class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
  DEFAULT_PASSWORD = 'pa$$w0rd'

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :admin_role_id, :admin_role, :password, :password_confirmation, :remember_me

  belongs_to :admin_role

  scope :teachers, lambda { where('admin_users.admin_role_id = ?', AdminRole.teacher.id) }
  scope :admins, lambda { where('admin_users.admin_role_id != ?', AdminRole.teacher.id) }

  validates :name, :presence => true, :uniqueness => true
  validates_presence_of :admin_role

  after_create { |admin| admin.send_reset_password_instructions }
  before_validation :setup_password, :on => :create



  def teacher?
    admin_role == AdminRole.teacher
  end

  private

  def setup_password
  	 self.password = DEFAULT_PASSWORD
  end

end
