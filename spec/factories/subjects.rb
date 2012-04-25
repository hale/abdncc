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

end
