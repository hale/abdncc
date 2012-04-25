require 'spec_helper'

describe "routing to courses" do
  let(:course) { FactoryGirl.create(:course)}
  subject { course }
  before { course.save}

  it "routes /course/:id to course#show for the course id" do
    { :get => "/courses/#{course.id}" }.should route_to(
      :controller => "courses",
      :action =>     "show",
      :id => "#{course.id}"
      )
  end

  it "routes /courses to courses#index" do
    { :get => "/courses"}.should route_to(
      :controller => "courses",
      :action => "index"
      )
  end

  describe "named routes" do
    it "routes course_path(:id) to course#show" do
      course_path(course.id).should == "/courses/#{course.id}"
    end

    it "routes courses_path to courses#index" do
      courses_path.should == "/courses"
    end
  end

end