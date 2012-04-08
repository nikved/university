class StudentsController < InheritedResources::Base

  skip_before_filter :require_login, :only => [:new, :create]
  respond_to :html, :json
  helper_method :search

  protected

  def resource
    @student ||= StudentDecorator.find params[:id]
  end

  def collection
    @students ||= StudentDecorator.decorate(search.relation)
  end

  def search
    @search ||= Student.search params[:search]
  end

end
