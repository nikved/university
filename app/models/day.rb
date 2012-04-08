class Day < ActiveRecord::Base

  DAYNAMES = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

  belongs_to :schedule
  has_many :lessons

  default_scope includes(:lessons)

  validates_inclusion_of :name, :in => DAYNAMES

  alias _lessons lessons

  def lessons(student = nil)
    _lessons.where(:student_id => nil).all # TODO: fix overwrite
  end

  def lessons_for(student)
  	_lessons.where(:student_id => student.id).all
  end

end