require 'spec_helper'

describe CoursesController do
  let(:course) { FactoryGirl.create(:course) }
  subject { course }

  before{ course.save }

  describe "GET show" do

    it "assigns the course to @course" do
      get :show, :id => course.id
      assigns(:course).should eq(course)
    end

  end

  describe "GET index" do

    it "assigns all courses to @courses" do
      get :index
      assigns(:courses).should include(course)
    end
  end    





end
