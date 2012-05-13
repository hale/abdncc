require 'spec_helper'

describe "routing to courses" do
  let(:course) { FactoryGirl.create(:course)}
  subject { course }
  before { course.save}

  it "routes /courses/:id to course#show for the course id" do
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

  context 'search' do
    it "routes /courses/search/:query to courses#search" do
      { :get => "/search" }.should route_to(
        :controller => "courses",
        :action => 'index')
    end
  end

  describe "named routes" do
    it "routes course_path(:id) to course#show" do
      course_path(course.id).should == "/courses/#{course.id}"
    end

    it "routes courses_path to courses#index" do
      courses_path.should == "/courses"
    end

    it "routes course_search_path to courses#search" do
      course_search_path.should == '/search'
    end
  end
end

describe "routing to subjects" do
  let(:subject) { FactoryGirl.create(:subject)}
  subject { subject }
  before { subject.save}

  it "routes /subjects/:id to subject#show for the subject id" do
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



describe "sessions" do
  let(:user) { FactoryGirl.create(:user) }

  it "routes GET /sessions/new to sessions#new" do
    { :get => "/sessions/new" }.should route_to(
      :controller => "sessions",
      :action     => "new")
  end

  it "routes DELETE /sessions/:id to sessions#destroy" do
    { :delete => "/sessions/#{user.id}" }.should route_to(
      :controller => "sessions",
      :action     => "destroy",
      :id         => "#{user.id}")
  end

  it "routes POST /sessions to sessions#new" do
    { :post => "/sessions" }.should route_to(
      :controller => "sessions",
      :action     => "create")
  end
end

describe "routing to users" do
  let(:user) { FactoryGirl.create :user }
  subject { user }
  it { should be_valid }
  before { user.save }

  it "routes GET /users/:id to users#show" do
    { :get => "/users/#{user.id}"}.should route_to(
      :controller => "users",
      :action => 'show',
      :id => "#{user.id}"
      )
  end

  it "routes GET /users to users#index" do
    { :get => "/users" }.should route_to(
      :controller => 'users',
      :action => 'index'
      )
  end

  it "routes GET /users/new to users#new" do
    { :get => "/users/new" }.should route_to(
      :controller => "users",
      :action     => "new"
      )
  end

  it "routes POST /user/:id/add_course to users#add_course" do
    { :post => "/users/#{user.id}/add_course"}.should route_to(
      :controller => 'users',
      :action => 'add_course',
      :id => "#{user.id}"
      )
  end

  it "routes POST /user/:id/remove_course to users#remove_course" do
    { :post => "/users/#{user.id}/remove_course"}.should route_to(
      :controller => 'users',
      :action => 'remove_course',
      :id => "#{user.id}"
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

