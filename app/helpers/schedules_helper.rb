module SchedulesHelper

  def new_lesson_button
    if can? :create_lesson, resource 

      content_tag :div, :class => 'form-actions' do
        link_to new_lesson_path, :remote => true, :class => 'btn' do
          raw %(<i class="icon-plus"></i>New Lesson)
        end
      end

    end
  end

end
