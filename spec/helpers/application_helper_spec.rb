require 'spec_helper'

describe ApplicationHelper do   
  describe "#current_user" do
    let(:user) { FactoryGirl.create(:user) }

    context "the current user has an account" do
      it "assigns the current user to @current_user" do
        session[:user_id] = user.id
        helper.current_user.should == user
      end
    end

    context "the current user is a guest" do
      it "returns nil" do
        session[:user_id] = nil
        helper.current_user.should == nil
      end
    end

    context "the session[:user_id] is not found in the database" do
      it "returns nil" do
        session[:user_id] = 123456789
        helper.current_user.should == nil
      end
    end

  end
  
end