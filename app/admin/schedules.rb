ActiveAdmin.register Schedule do
  
  menu :if => proc { can? :manage, Schedule }
  controller.authorize_resource

  actions :all, :except => [:new, :create, :destroy, :edit]
  scope(:all, :default => true) { |sc| sc.includes :group }

  index do
    column :group, :sortable => 'groups.number'
    default_actions
  end

  show :title => :name do |schedule|
    schedule.days.each do |day|
      div do
        h2 { day.name }
        table_for day.lessons, :class => 'index_table' do
          column :time, :strftime
          column :name
          column :teacher
          column(:'lecture/practice') { |lesson| lesson.lecture? ? status_tag('lecture', :error) : status_tag('practice') }
          column :room
          column :notes
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
      end
    end

    div do
      active_admin_form_for [:admin, lesson] do |f|
        f.inputs do
          f.input :day, :as => :select, :collection => schedule.days, :include_blank => false
          f.input :time
          f.input :name
          f.input :teacher, :collection => current_admin_user.teacher? ? [current_admin_user] : AdminUser.all, :include_blank => !current_admin_user.teacher?
          f.input :lecture
          f.input :room
          f.input :notes
        end
        f.buttons
      end
    end
  end

  controller do
    def show
      @lesson = Lesson.new
      @schedule = Schedule.find(params[:id])
      show!
    end
  end

  filter :group
  filter :group_faculty_name, :collection => Faculty.all.map(&:name), :as => :select
  filter :group_department_name, :collection => Department.all.map(&:name), :as => :select
  filter :group_branch_name, :collection => Branch.all.map(&:name), :as => :select

end
