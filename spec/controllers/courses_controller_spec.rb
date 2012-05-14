require 'spec_helper'

describe CoursesController do
  let(:course) { FactoryGirl.create(:course) }
  let(:rand_course) { FactoryGirl.create(:rand_course) }
  subject { course }

  before{ course.save }
  before{ rand_course.save }

  describe "GET show" do

    it "assigns the course to @course" do
      get :show, :id => course.id
      assigns(:course).should eq(course)
    end
    it "assigns Comment.new to @comment" do
      get :show, :id => course.id
      assigns(:comment).should be_a(Comment)
    end
  end

  describe "GET index" do

    it "assigns all courses to @courses" do
      get :index
      assigns(:courses).should include(course)
    end
    it "assigns matching courses to @courses if params[:query] is present" do
        post :index, :query => course.name
        assigns(:courses).should include(course)
        assigns(:courses).should_not include(rand_course)
    end
  end

  
end
