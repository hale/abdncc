require 'spec_helper'

describe CoursesController do
  let(:course) { FactoryGirl.create(:course) }
  subject { course }

  describe "GET show" do
    before{ course.save }

    it "assigns the course to @course" do
      get :show, :id => course.id
      assigns(:course).should eq(course)
    end

  end

  describe "GET index" do
    before{ course.save }

    it "assigns all courses to @courses" do
      get :index
      assigns(:courses).should eq([course])
    end
  end    





end
