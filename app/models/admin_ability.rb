class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    admin ||= AdminUser.new
    admin.admin_role.ability_items.each do |ability|
      can :manage, ability.data.constantize
    end
    can :edit_delete, Lesson if can? :manage, Lesson
    cannot :edit_delete, Lesson do |lesson|
      admin.teacher? && lesson.teacher != admin
    end
  end

end
