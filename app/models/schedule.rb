class Schedule < ActiveRecord::Base

  belongs_to :group
  has_many :days, :dependent => :destroy

  after_create { Day::DAYNAMES.each { |name| self.days.create :name => name } }

  default_scope includes(:days, :group)

  def name
    "#{group.name} Schedule"
  end

end
