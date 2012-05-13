# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user
    course
    content Faker::Lorem.paragraph
  end

  factory :rand_comment, class: Comment do
    association :user, factory: :rand_user
    association :course, factory: :rand_course
    content Faker::Lorem.paragraph
  end
end
