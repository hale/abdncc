# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :course, class: Course do    
    credits     [15, 20, 30, 60].sample
    level       [1,2,3,4].sample  
    after_build do |course|
      course.name        = Faker::Lorem.sentence.upcase      
      course.coordinator = Faker::Name.name
      course.prereq      = Faker::Lorem.sentence
      course.note        = Faker::Lorem.sentence(15)
      course.description = Faker::Lorem.paragraph(10)
      course.assessment  = Faker::Lorem.paragraph      
      course.department  = "School of #{Faker::Lorem.words.first.titlecase}"
      course.ccode = course.rand_ccode
      course.subject = FactoryGirl.build(:subject, courses: [course])
    end

    factory :course_with_comments do
      after_build do |course|
        course.ccode = course.rand_ccode
        course.comments = [FactoryGirl.build(:comment, course_id: course.id)]
      end
    end

    factory :course_with_users do
      after_build do |course|
        course.ccode = course.rand_ccode
        course.users << [FactoryGirl.build(:user)]
      end
    end
  end

end