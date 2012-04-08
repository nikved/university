class GroupMailer < ActionMailer::Base

  def schedule_changed(lesson)
    group = lesson.day.schedule.group
    mail :from    => lesson.teacher.email,
         :to      => group.students.map(&:email),
         :subject => 'Schedule changed'
  end

end
