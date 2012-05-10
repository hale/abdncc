require 'spec_helper'

describe "Users" do
  let(:user) { FactoryGirl.create(:user) }
  before { user.save }

  describe "new.html.erb the signup page" do
    before { visit new_user_path }
    subject { page }

    it { should have_selector 'title', :text => "Signup form" }

    describe "the signup form" do
      context "valid information" do
        it "creates an account for the user" do
          fill_in 'user_email', :with => 'user@example.com'
          fill_in 'user_password', :with => 'foobar'
          click_button 'Sign up'
          page.should have_content "Welcome"
        end
      end

      context "invalid information" do
        it "displays the errors to the user" do
          fill_in 'user_email', :with => 'user@example@example.com'
          fill_in 'user_password', :with => 'foo'
          click_button 'Sign up'
          # current_path.should == new_user_path
          page.should have_selector('.error_messages')
        end
      end
    end

  end

  describe "show.html.erb the user page" do
    before { visit user_path(user) }
    subject { page }

    it { should have_selector 'title', :text => "#{user.name}" }

    describe "user attributes" do
      subject{ page.body }
      it { should have_content user.name }
      it { should have_content user.status }

      context "the list of courses this user has taken / is taking" do
        it { should have_selector '.courses' }
        it { should have_selector '.course' }
      end
    end
  end
end
