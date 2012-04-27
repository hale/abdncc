require 'spec_helper'

describe SubjectsController do
  let(:subject) { FactoryGirl.create :subject }
  subject { subject }

  before { subject.save }

  describe "GET show" do
    it "assigns the subject to @subject" do
      get :show, :id => subject.id
      assigns(:subject).should eq(subject)
    end
    
  end

  describe "GET index" do
    it "assigns all subjects to @subjects" do
      get :index
      assigns(:subjects).should include(subject)
    end
  end


end
   