require 'spec_helper'

describe "Sessions" do
  let(:user) { FactoryGirl.create(:user) }
  before { user.save }

  describe "the root url" do
    before { visit root_path }
    subject { page }

    it { should have_content "Log in" }
    it { should have_content "Sign up"}
  end

  describe "new.html.erb the login page" do
    before { visit new_session_path }
    subject { page }

    it { should have_selector 'title', :text => "Log in" }
    its(:body) { should have_content "Log in" }

    describe "the log in form" do
      context "valid credentials" do
        it "logs the user in" do
          fill_in 'email', :with => user.email
          fill_in 'password', :with => 'foobar'
          click_button "Log in"
          page.should have_content "Logged in!"
        end
      end

      context "invalid credentials" do
        it "does not log the user in" do
          fill_in 'email', :with => user.email.upcase
          fill_in 'password', :with => 'foobar'*2
          click_button "Log in"
          page.should have_content "Invalid"
        end
      end

    end
  end
end
