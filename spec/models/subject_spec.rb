require 'spec_helper'

describe Subject do
  it { should  have_many(:courses).dependent(:destroy) }

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

