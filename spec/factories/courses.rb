# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name        "ARABIC FOR BEGINNERS 3"
    ccode       "AR 2002"
    credits     15
    coordinator "Dr G Sharman"
    prereq      "Normally AR 1501 or permission of Head of School"
    note        "Please note, this course is designed for beginners to Arabic and is not available to native speakers."
    description "Written and spoken Arabic. Introduction to very basic cultural phenomena.Reading passages.Writing exercises.Translation exercises.Role play.Dialogue.Readings and discussions about Arabic culture. 3 one-hour classes per week 1 tutorial per week. 1st attempt: Course work (60%) Examination (40% = Oral 10%, written 30%). Resit: 1 two-hour written examination (100%)."
    assessment  "Four written assessments, in weeks 3, 6, 8 and 11. The above assessments are given CAS marks, and written or verbal feedback is also given. Additional informal feedback on performance and workshop participation is also given."
    level       2
    subject     
    department  "School of Language and Literature"
  end

  factory :rand_course do
    name        Faker::Lorem.sentence.upcase
    credits     [15, 20, 30, 60].sample
    coordinator Faker::Name.name
    prereq      Faker::Lorem.sentence
    note        Faker::Lorem.sentence(15)
    description Faker::Lorem.paragraph(10)
    assessment  Faker::Lorem.paragraph
    level       rand(1..4)  
    department  "School of #{Faker::Lorem.words.first.titlecase}"
    association :subject, factory: :rand_subject   
    after_build do |subj|
        subj.ccode = subj.rand_ccode
    end
  end
end