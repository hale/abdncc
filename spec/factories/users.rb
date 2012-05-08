# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Philip Hale"
    email "p.hale.09@aberdeen.ac.uk"
    status "3rd Year Computing Science BSc"
    password "foobar"
    after_build do |user|
      user.courses = [FactoryGirl.build(:course)]
      user.bookmarks = [FactoryGirl.build(:course)]
    end
  end

  factory :rand_user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    status "#{['First','Second','Third','Fourth'].sample} Year #{Faker::Lorem.words[0..1].to_sentence.titlecase} #{['BSc','MPhil','MA','MSc','PhD'].sample}" 
    password "foobar"
    after_build do |user|
      user.courses = FactoryGirl.build_list(:rand_course, 12)
      user.bookmarks = FactoryGirl.build_list(:rand_course, 5)
    end
  end
end
