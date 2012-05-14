# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    name "Arabic"
    code "AR"

    factory :subject_with_courses do
      after_build do |subject|
        subject.courses << FactoryGirl.build(:course, :subject => subject)
      end
    end

  end

  factory :rand_subject, class: Subject do
  	after_build do |subject|
      subject.name = Faker::Lorem.words.first.titlecase
  		subject.code = subject.name[0..1].upcase
  	end

    factory :rand_subject_with_courses do
      after_build do |subject|
        subject.courses << FactoryGirl.build(:rand_course, :subject => subject)
      end
    end
    
  end


end
