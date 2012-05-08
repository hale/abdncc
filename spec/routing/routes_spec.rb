require 'spec_helper'

describe "routing to courses" do
  let(:course) { FactoryGirl.create(:course)}
  subject { course }
  before { course.save}

  it "routes /course/:id to course#show for the course id" do
    { :get => "/courses/#{course.id}" }.should route_to(
      :controller => "courses",
      :action     => "show",
      :id         => "#{course.id}"
    )
  end

  it "routes /courses to courses#index" do
    { :get => "/courses"}.should route_to(
      :controller => "courses",
      :action     => "index"
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

describe "routing to subjects" do
  let(:subject) { FactoryGirl.create(:subject)}
  subject { subject }
  before { subject.save}

  it "routes /subject/:id to subject#show for the subject id" do
    { :get => "/subjects/#{subject.id}" }.should route_to(
      :controller => "subjects",
      :action     => "show",
      :id         => "#{subject.id}"
      )
  end

  it "routes /subjects to subjects#index" do
    { :get => "/subjects" }.should route_to(
      :controller => "subjects",
      :action     => "index"
      )
  end

  describe "named routes" do
    it "routes subject_path(:id) to subjects#show" do
      subject_path(subject.id).should == "/subjects/#{subject.id}"
    end

    it "routes subjects_path to subjects#index" do
      subjects_path.should == "/subjects"
    end
  end

  end

describe "static pages" do
  it "routes / to subjects#index" do
    { :get => "/" }.should route_to(
      :controller => "subjects",
      :action     => "index")
  end
end

describe "routing to users" do
  let(:user) { FactoryGirl.create :user }
  subject { user }
  it { should be_valid }
  before { user.save }

  it "routes /user/:id to users#show" do
    { :get => "/users/#{user.id}"}.should route_to(
      :controller => "users",
      :action => 'show',
      :id => "#{user.id}"
      )
  end

  it "routes /users to users#index" do
    { :get => "/users" }.should route_to(
      :controller => 'users',
      :action => 'index'
      )
  end

  it "routes /users/new to users#new" do
    { :get => "/users/new" }.should route_to(
      :controller => "users",
      :action     => "new"
      )
  end

  describe "named routes" do
    it "routes user_path(:id) to users#show" do
      user_path(user.id).should == "/users/#{user.id}"
    end

    it "routes users_path to users#index" do
      users_path.should == "/users"
    end

    it "routes new_user_path ro users#new" do
      new_user_path.should == "/users/new"
    end
    
  end


end

