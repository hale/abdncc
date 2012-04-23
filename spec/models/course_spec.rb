require 'spec_helper'

describe Course do
  let(:course) { FactoryGirl.create(:course)}

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


end
