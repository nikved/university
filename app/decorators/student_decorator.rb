class StudentDecorator < ApplicationDecorator
  decorates :student

  def json_schema
    {
      :only => [:id, :username, :email, :first_name, :last_name, :birthday],
      :include => {
        :group => {
          :only => :id,
          :methods => :name,
          :include => {
            :branch => { 
              :only => [:id, :name, :description]
            }
          }
        }
      }
    }
  end

  def username
    value_none student.username
  end

  def email
    value = student.email.presence
    value ? h.mail_to(value) : none
  end

  def first_name
    value_none student.first_name
  end

  def last_name
    value_none student.last_name
  end

  def group
    value_none student.group.try(:name)
  end

  def birthday
    value_none student.birthday
  end

end