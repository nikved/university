class ExamsController < InheritedResources::Base

  respond_to :html, :json
  helper_method :search
  
  protected

  def collection
    @exams ||= ExamDecorator.decorate(search.relation)
  end
  
  def search
    @search ||= Exam.search(params[:search])
  end


end
