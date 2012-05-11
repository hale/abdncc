require 'spec_helper'

describe SessionsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET new" do
    it "renders the log in page" do
      get :new
      response.code.should eq('200')
    end
  end

  describe "POST create" do
    context "correct credentials" do

      it "creates a new session for the current user" do
        post :create, :email => user.email, :password => 'foobar'
        session[:user_id].should == user.id
      end
    end

    context "incorrect credentials" do
      it "doesn't create a new session" do
        post :create, :email => user.email.upcase, :password => 'foobar'*2
        session[:user_id].should_not == user.id
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the session" do
      delete :destroy, :id => user.id
      session[:user_id].should_not == user.id
    end
  end

end
