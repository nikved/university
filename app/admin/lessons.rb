ActiveAdmin.register Lesson do
  
  controller.authorize_resource

  menu false

  actions :all, :except => [:new]

  index do
    column :time, :strftime
    column :name
    column :teacher
    column :day
    column :lecture
    column '' do |lesson|
      links = ''.html_safe
      links += link_to 'View', admin_lesson_path(lesson), :class => 'member_link view_link'
      if can? :edit_delete, lesson
        links += link_to 'Edit', edit_admin_lesson_path(lesson), :class => 'member_link edit_link'
        links += link_to 'Delete', admin_lesson_path(lesson), :method => :delete, :confirm => 'Are you sure you want to delete this?', :class => 'member_link delete_link'
      end
      links
    end
  end

  form do |f|
    f.inputs do
      f.input :day, :collection => [f.object.day], :include_blank => false
      f.input :time
      f.input :name
      f.input :teacher, :collection => current_admin_user.teacher? ? [current_admin_user] : AdminUser.all, :include_blank => !current_admin_user.teacher?
      f.input :lecture
      f.input :room
      f.input :notes
    end
    f.buttons
  end

  show do
    attributes_table do
      row :time, &:strftime
      row :name
      row :teacher
      row :day
      row :lecture
      row :notes
      row(:schedule) { |l| link_to 'Schedule', [:admin, l.day.schedule] if l.day.try :schedule }
    end

  end

  controller do
    def create
      @lesson = Lesson.new(params[:lesson])
      time = Time.now.utc.change(:hour => params[:lesson][:'time(4i)'].to_i, :min => params[:lesson][:'time(5i)'].to_i, :sec => 0)
      @lesson.time = time
      create!
    end

    def update
      @lesson = Lesson.find(params[:id])
      @lesson.attributes = params[:lesson]
      @lesson.time = Time.now.utc.change(:hour => params[:lesson][:'time(4i)'].to_i, :min => params[:lesson][:'time(5i)'].to_i, :sec => 0)
      update!
    end
  end

end
