require 'spec_helper'

describe "Users" do
  let(:user) { FactoryGirl.create(:user) }
  before { user.save }

  describe "new.html.erb the signup page" do
    before { visit new_user_path }
    subject { page }

    it { should have_selector 'title', :text => "Signup form" }

    # TODO: this is a bad spec
    describe "the root url" do
      it "should have a logout link in the nav bar" do
        visit new_session_path
        fill_in 'email', :with => user.email
        fill_in 'password', :with => 'foobar'
        click_button 'Log in'
        click_link "Aberdeen Course Catalogue"
        click_link "Log out"
        page.should have_content "out"
      end

    end


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

  describe "edit.html.erb the edit user page" do
    before { visit edit_user_path user.id }
    subject { page }

    it { should have_selector 'title', :text => "Editing #{user.name}" }

    describe "the edit form" do
      context "valid data" do
        it "should update the user's attributes" do
          within( 'form.edit-user' ) do
            fill_in 'user_name', :with => 'Flash Gordon'
            fill_in 'user_password', :with => 'foobar'
            click_button 'Save'
          end
          page.should have_content 'Flash Gordon'
        end
      end

      context "invalid data" do
        it "should render errors and not update" do
          within( 'form.edit-user' ) do
            fill_in 'user_name', :with => 'Flash Gordon'
            fill_in 'user_password', :with => 'foo'
            fill_in 'user_email', :with => user.email*2
            click_button 'Save'
          end
          page.should have_selector('.error_messages')
        end
      end
    end

  end
end
