class ApplicationDecorator < Draper::Base

  def json_schema
    { :only => :id }
  end

  def to_json(*)
    to_model.to_json json_schema
  end

  def as_json(*)
    to_model.as_json json_schema
  end

  protected

  def none
    '(none)'
  end

  def value_none(val)
    val.presence || none
  end

end