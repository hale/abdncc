# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :comment do
    user
    course
    after_build do |comment|
      comment.content = Faker::Lorem.paragraph
    end
  end
end
