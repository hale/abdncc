# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_min, class: User do
    email
    password 'foobar'
  end

  factory :user do
    name "Philip Hale"
    email # generates an email sequence.  see sequences.rb
    status "3rd Year Computing Science BSc"
    password "foobar"

    factory :user_with_comments do
      after_build do |user|
        user.comments = [FactoryGirl.build(:comment, :user => user)]
      end
    end

    factory :user_with_courses do
      after_build do |user|
        user.courses = [FactoryGirl.build(:course)]
      end
    end

  end

  factory :rand_user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    status "#{['First','Second','Third','Fourth'].sample} Year #{Faker::Lorem.words[0..1].to_sentence.titlecase} #{['BSc','MPhil','MA','MSc','PhD'].sample}" 
    password "foobar"

    factory :rand_user_with_comments do
      after_build do |user|
        user.comments = FactoryGirl.build_list(:rand_comment, 4, :user => user)
      end
    end

    factory :rand_user_with_courses do
      after_build do |user|
        user.courses = FactoryGirl.build_list(:rand_course, 12, :user => user)
      end
    end

  end
end
