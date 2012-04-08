class Exam < ActiveRecord::Base

  belongs_to :teacher, :class_name => 'AdminUser'
  belongs_to :group

  validates_presence_of :lesson, :teacher, :time, :room, :group
  validates_numericality_of :room

end
