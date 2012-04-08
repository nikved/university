module ApplicationHelper

  def nav_items
    items = Hash.new

    if logged_in?
      items['Personal Information'] = student_path(current_user)
      items['Students'] = students_path
      items['Schedules'] = schedules_path
      items['Exams'] = exams_path
    end

    items
  end

  def nav_right_items
    if logged_in?
      { 'Logout' => logout_path }
    else
      {}
    end
  end

  def tooltip(text, len = 40)
    link_to text.truncate(45), '#', :rel => 'tooltip', :'data-original-title' => text
  end

  def flash_message(type, message = nil)
    message ||= flash[type]
    if message.present?
      %(<div class="alert alert-#{type}"><a class="close" data-dismiss="alert">&#xD7;</a>#{message}</div>).html_safe
    end
  end

  def flash_messages
    content = ''.html_safe

    content << flash_message(:success) if flash[:success]
    content << flash_message(:warning) if flash[:warning]
    content << flash_message(:error) if flash[:error]

    content
  end

  def modal(header = '', body = '', footer = '')
    render '/shared/modal', :header => header, :body => body, :footer => footer
  end

end
