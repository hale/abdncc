require 'spec_helper'

describe Subject do
  it { should  have_many(:courses) }

  let(:subj) { FactoryGirl.create(:subject)}
  before { subj.save }

  describe "the subject attributes" do
    subject { subj }
    it { should be_valid }
    it { should respond_to :name }
    it { should respond_to :code }
  end
  
  describe "overriding the to_s method" do
    subject { subj.to_s }
    it { should == subj.name }
  end

  describe "returning collections of courses based on level" do
    it "groups level 1 courses" do
      subj.courses_where(:level => 1).each do |course|
        course.level.should == 1
      end
    end
    it "groups level 2 courses" do
      subj.courses_where(:level => 2).each do |course|
        course.level.should == 2
      end
    end
    it "groups level 3 courses" do
      subj.courses_where(:level => 3).each do |course|
        course.level.should == 3
      end
    end
    it "groups level 4 courses" do
      subj.courses_where(:level => 4).each do |course|
        course.level.should == 4
      end
    end

  end

end

# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  code       :string(255)
#  course_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

