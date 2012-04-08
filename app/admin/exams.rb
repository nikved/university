ActiveAdmin.register Exam do

  menu :if => proc { can? :manage, Exam }
  controller.authorize_resource

  index do
    column :group
    column :time
    column :lesson
    column :teacher
    column :room
    column(:notes) { |exam| exam.notes.truncate(50) }
    
    default_actions
  end

  show do |exam|
    attributes_table do
      row :group
      row :time
      row :lesson
      row :teacher
      row :room
      row :notes
    end
  end

  form do |f|
    f.inputs do
      f.input :group
      f.input :time
      f.input :lesson, :as => :select, :collection => Lesson.names
      f.input :teacher
      f.input :room
      f.input :notes
    end
    f.buttons
  end
  
end
