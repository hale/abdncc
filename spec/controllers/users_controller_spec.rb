require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user)}

  describe "GET new" do
    it "assigns User.new to @user" do
      get :show, :id => user.id
      assigns(:user).should be_an_instance_of(User)
    end
  end

  # describe "POST create" do
  #   it "assigns params[:user] to @user" do
  #     post :create  #, params[:user] = {:email => 'user@example.com', :password => 'foobar'}
  #     assigns(:user).should be_new_record
  #   end
  # end




end
