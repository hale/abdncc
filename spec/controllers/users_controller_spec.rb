require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user)}

  describe "GET new" do
    it "assigns User.new to @user" do
      get :new, :id => user.id
      assigns(:user).should be_an_instance_of(User)
    end
  end

  describe "POST create" do
    before { post :create, :user => {:email => 'user@example.com', :password => 'foobar'} }
    it "assigns params[:user] to @user" do
      assigns(:user).should be_valid
    end
    it "adds the user to the users table" do
      User.find(user.id).should == user
    end
  end

  describe "GET show" do
    it "assigns User.find(:id) to @user" do
      get :show, :id => user.id
      assigns(:user).should eq(user)
    end
  end

  describe "GET edit" do
    it "assigns params[:user] to @user" do
      get :edit, :id => user.id
      assigns(:user).should == user
    end
  end

  describe "PUT update" do
    it "assigns params[:user] to @user" do
      put :update, :id => user.id
      assigns(:user).should == user
    end    
  end

  describe "POST add_course" do
    let(:course) { FactoryGirl.create(:course) }
    before { post :add_course, :id => user.id, :course_id => course.id }

    it "assigns params[:user] to @user" do
      assigns(:user).should == user
    end
    it "assigns params[:course_id] to @course" do
      assigns(:course).should == course
    end
    it "adds the course to the user's course list" do
      User.find(user.id).courses.should include(course)
    end
    it "redirects to the course page" do
      response.should redirect_to course_path course
    end

  end




end
