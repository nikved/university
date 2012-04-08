class ScheduleDecorator < ApplicationDecorator
  decorates :schedule

  def json_schema
    {
      :methods => :name,
      :only => :id,
      :include => {
        :days => {
          :only => :name,
          :include => {
            :lessons => {
              :only => [:lecture, :room],
              :methods => :strftime
            }
          }
        }
      }
    }
  end

  
end