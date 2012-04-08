def rand_name
	Forgery::LoremIpsum.words(1000).scan(/\w{7,}/).sample
end

if Faculty.count < 10
  10.times do
    faculty = Faculty.create :name        => "Faculty of #{rand_name}",
                             :description => Forgery::LoremIpsum.words
    ap "faculty #{faculty.name} created" if faculty.persisted?
  end
end

if Department.count < 20
  20.times do
    dep = Department.create :faculty     => Faculty.first(:order => 'rand()'),
                            :name        => "Department of #{rand_name}",
                            :description => Forgery::LoremIpsum.words
    ap "department #{dep.name} created" if dep.persisted?
  end
end

if Branch.count < 20
  20.times do
    branch = Branch.create :faculty     => Faculty.first(:order => 'rand()'),
                           :name        => rand_name.capitalize,
                           :description => Forgery::LoremIpsum.words
    ap "branch #{branch.name} created" if branch.persisted?
  end
end

if Group.count < 10
  20.times do
    group = Group.new :faculty => Faculty.first(:order => 'rand()'),
                       :number => Forgery::Basic.number,
                       :start_year => Forgery::Date.year(:past => true, :min_delta => 2, :max_delta => 8)
    group.branch     = group.faculty.branches.first(:order => 'rand()')
    group.department = group.faculty.departments.first(:order => 'rand()')
    group.save

    ap "gropu #{group.name} created" if group.persisted?
  end
end

if Student.count < 100
  50.times do
    student = Student.create :email                 => Forgery::Email.address,
                             :password              => AdminUser::DEFAULT_PASSWORD,
                             :password_confirmation => AdminUser::DEFAULT_PASSWORD,
                             :first_name            => Forgery::Name.first_name,
                             :last_name             => Forgery::Name.last_name,
                             :group                 => Group.first(:order => 'rand()'),
                             :birthday              => Forgery::Date.date(:past => true, :min_delta => 8000, :max_delta => 9000)
    ap "student #{student.name} created" if student.persisted?
  end
end

%w(AdminUser Branch Day Department Exam Faculty Group Lesson Schedule Student AdminRole).each do |klass|
  AbilityItem.find_or_create_by_data klass
end

AdminUser.find_or_create_by_email :name       => 'Main Admin', 
                                  :email      => 'admin@admin.com',
                                  :password   => AdminUser::DEFAULT_PASSWORD,
                                  :admin_role => AdminRole.super_admin
if AdminUser.count < 10
  10.times do
    admin = AdminUser.create :name       => Forgery::Name.full_name, 
                             :email      => Forgery::Email.address,
                             :password   => AdminUser::DEFAULT_PASSWORD,
                             :admin_role => AdminRole.teacher
    ap "teacher #{admin.name} created" if admin.persisted?
  end
end

Day.all.each do |day|
  if day.lessons.empty?
    [[13, 0], [14, 30], [16, 0]].each do |h, m|
      Lesson.create :time    => Time.now.utc.change(:hour => h, :min => m),
                    :day     => day,
                    :name    => rand_name,
                    :teacher => AdminUser.all.sample,
                    :lecture => [true, false].sample,
                    :room    => (100..600).to_a.sample,
                    :notes   => Forgery::LoremIpsum.words
    end
  end
end