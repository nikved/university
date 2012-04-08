class Lesson < ActiveRecord::Base

  belongs_to :day
  belongs_to :teacher, :class_name => 'AdminUser'
  belongs_to :student # custom lesson (visible for only one user)

  validates_presence_of :day, :teacher, :time, :room, :name

  default_scope order('lessons.time')

  after_update :notify_students

  def strftime
    time.strftime('%H:%M')
  end

  def self.names
    select('distinct(name)').map &:name
  end

  private

  def notify_students
    GroupMailer.schedule_changed(self).deliver
  end

end
