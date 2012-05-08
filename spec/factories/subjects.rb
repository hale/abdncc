# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    name "Arabic"
    code "AR"
    after_build do |subject|
      subject.courses << FactoryGirl.build(:course, 
                                           :subject => subject)
    end
  end

  factory :rand_subject, class: Subject do
  	name Faker::Lorem.words.first.titlecase
  	after_build do |subject|
  		subject.code = subject.name[0..1].upcase
  		subject.courses << FactoryGirl.build(:rand_course, :subject => subject)
  	end
  end


end
