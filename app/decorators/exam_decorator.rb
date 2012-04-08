class ExamDecorator < ApplicationDecorator
  decorates :exam

  def json_schema
    {
      :only => [:id, :lesson, :time, :room, :notes],
      :include => {
        :group => {
         :only => :id,
         :methods => :name
        }, 
        :teacher => {
          :only => :name
        }
      }
    }
  end

  def group
    exam.group.name
  end

  def teacher
    exam.teacher.name
  end

end