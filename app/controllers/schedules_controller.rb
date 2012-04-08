class SchedulesController < InheritedResources::Base

  respond_to :html, :json
  helper_method :search

  protected

  def collection
    @schedules ||= ScheduleDecorator.decorate(search.relation)
  end

  def resource
    @schedule ||= ScheduleDecorator.find(params[:id])
  end

  def search
    @search ||= Schedule.search(params[:search])
  end

end
