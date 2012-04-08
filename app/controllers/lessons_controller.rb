class LessonsController < InheritedResources::Base
  respond_to :html, :js

  def new
  	@lesson = Lesson.new
    @days = current_user.schedule.days
    new!
  end

  def create
    @lesson = current_user.lessons.build(params[:lesson])
    time = Time.now.utc.change(:hour => params[:lesson][:'time(4i)'].to_i, :min => params[:lesson][:'time(5i)'].to_i, :sec => 0)
    @lesson.time = time
    create!
  end
  
end
