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
    it "assigns params[:user] to @user" do
      post :create, :user => {:email => 'user@example.com', :password => 'foobar'}
      assigns(:user).should be_valid
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




end
