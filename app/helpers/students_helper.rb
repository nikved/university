module StudentsHelper

  def profile_title
    raw "<legend>#{resource.username.capitalize}'s Profile</legend>"
  end

  def edit_profile_button
    if can? :edit, resource
      link_to edit_student_path(resource), :class => 'btn' do
        raw '<i class="icon-edit"></i>Edit'
      end
    end
  end

end
