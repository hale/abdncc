# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_min, class: User do
    email
    password 'foobar'
  end

  factory :user do 
    password "foobar"
    after_build do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.status = "#{['First','Second','Third','Fourth'].sample} Year #{Faker::Lorem.words[0..1].to_sentence.titlecase} #{['BSc','MPhil','MA','MSc','PhD'].sample}" 
    end

    factory :user_with_comments do
      after_build do |user|
        user.comments = [FactoryGirl.build(:comment, :user => user)]
      end
    end

    factory :user_with_courses do
      after_build do |user|
        user.courses = [FactoryGirl.build(:course, :users => [user])]
      end
    end

  end
end
