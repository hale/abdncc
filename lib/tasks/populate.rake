namespace :db do
  desc "Fill in the database with pretend users"
  task populate: :environment do
    make_courses
    make_subjects
    make_users

    link_subjects_courses
    # add_courses_users
  end
end

def self.gen_ccode
  ccode = ''
  2.times { ccode << ('A'..'Z').to_a[rand(0..25)].to_s }
  ccode << ' '
  4.times { ccode << rand(1..9).to_s }
  ccode
end

def make_courses
  # Course.create(name:        "ARABIC FOR BEGINNERS 3",
  #               ccode:       "AR 2002",
  #               credits:     15,
  #               coordinator: "Dr G Sharman",
  #               prereq:      "Normally AR 1501 or permission of Head of School",
  #               note:        "Please note, this course is designed for beginners to Arabic and is not available to native speakers.",
  #               description: "Written and spoken Arabic. Introduction to very basic cultural phenomena.Reading passages.Writing exercises.Translation exercises.Role play.Dialogue.Readings and discussions about Arabic culture. 3 one-hour classes per week 1 tutorial per week. 1st attempt: Course work (60%) Examination (40% = Oral 10%, written 30%). Resit: 1 two-hour written examination (100%).",
  #               assessment:  "Four written assessments, in weeks 3, 6, 8 and 11. The above assessments are given CAS marks, and written or verbal feedback is also given. Additional informal feedback on performance and workshop participation is also given.",
  #               level:       2,
  #               department:  "School of Language and Literature"
  #               # subject added after subjects created
  # )
  99.times do
    Course.create(name:        Faker::Lorem.sentence.upcase,
                  ccode:       self.gen_ccode,
                  credits:     [15, 20, 30, 60].sample,
                  coordinator: Faker::Name.name,
                  prereq:      Faker::Lorem.sentence,
                  note:        Faker::Lorem.sentence(15),
                  description: Faker::Lorem.paragraph(10),
                  assessment:  Faker::Lorem.paragraph,
                  level:       rand(1..4),
                  department:  "School of #{Faker::Lorem.words.first.titlecase}"
                  # subject added after subjects created
    )
  end
end

def make_subjects
  courses = Course.all
  # Subject.create(name: 'Arabic',
  #                code: 'AR',
  #                courses: [Course.find_by_name('ARABIC FOR BEGINNERS 3')]
  #                )
  19.times do
    name = Faker::Lorem.words.first.titlecase
    Subject.create(name: name,
                   code: name[0..1].upcase,
                   courses: courses.sample(rand(4..20))
                   )
  end
end

def make_users
  courses = Course.all
  # User.create(name: 'Philip Hale',
  #             email: 'p.hale.09@aberdeen.ac.uk',
  #             status: '3rd Year Computing Science BSc',
  #             password: 'alalal',
  #             # courses: [Course.find_by_name('ARABIC FOR BEGINNERS 3')],
  #             # bookmarks: [Course.find_by_name('ARABIC FOR BEGINNERS 3')]
  #             )


  99.times do 
    User.create(name: Faker::Name.name,
                email: Faker::Internet.email,
                status: "#{['First','Second','Third','Fourth'].sample} Year #{Faker::Lorem.words[0..1].to_sentence.titlecase} #{['BSc','MPhil','MA','MSc','PhD'].sample}",
                password: 'foobar',
                courses: courses.sample(rand(4..20)),
                bookmarks: courses.sample(rand(0..5))
                )
  end
end

# def add_courses_users
#   User.all.each do |user|
#     (user.courses << courses.sample( rand(4..20) )).flatten
#     (user.bookmarks << courses.sample( rand(0..5) )).flatten
#     user.save
#   end
# end


def link_subjects_courses
  Course.all.each do |course|
    # assign a random subject to this course (uses randumb gem)
    course.update_attributes( :subject => Subject.random)
  end
end

# def link_users_courses
#   Course.all.each do |course|
#     # assign a random user to this course (uses randumb gem)
#     course.update_attributes( :user => User.random)
#   end
# end








