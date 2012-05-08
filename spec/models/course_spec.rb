require 'spec_helper'

describe Course do
  it { should belong_to(:subject) }
  
  let(:course) { FactoryGirl.create(:course)}
  # let(:courses) { FactoryGirl.create(:rand_course, 20)}
  # let(:subject) { FactoryGirl.create(:subject)}
  # let(:subjects) { FactoryGirl.create(:rand_subject, 5)}


  subject { course }

  it { should be_valid }


  describe "the course attributes" do
    before { course.save }

    it { should respond_to(:name)}
    it { should respond_to(:ccode)}
    it { should respond_to(:credits)}
    it { should respond_to(:coordinator)}
    it { should respond_to(:prereq)}
    it { should respond_to(:note)}
    it { should respond_to(:description)}
    it { should respond_to(:assessment)}
    it { should respond_to(:level)}
    it { should respond_to(:subject)}
    it { should respond_to(:department)}
  end

  describe 'filtering courses based on level' do
  end

  describe "sample ccode" do
    subject { course.rand_ccode }
    its(:length) { should == 7 }
  end
    

  


end

# == Schema Information
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  ccode       :string(255)
#  credits     :integer
#  coordinator :string(255)
#  prereq      :string(255)
#  note        :text
#  description :text
#  assessment  :text
#  level       :integer
#  department  :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  subject_id  :integer
#  user_id     :integer
#

