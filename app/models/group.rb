class Group < ActiveRecord::Base

  belongs_to :faculty
  belongs_to :branch
  belongs_to :department
  has_many :students
  has_one :schedule, :dependent => :destroy
  has_many :exams

  validates_presence_of :faculty, :branch, :start_year, :number
  validates :number, :numericality => { :greater_than => 0, :less_than => 100 }, :uniqueness => { :scope => [:faculty_id, :start_year] }

  after_create { Schedule.create :group => self }

  def name
    "#{faculty.name} - ##{number} (#{start_year})"
  end

end
