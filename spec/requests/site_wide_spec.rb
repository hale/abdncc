require 'spec_helper'

describe 'Site wide elements' do
  let(:user) { FactoryGirl.create(:user) }
  let(:course) { FactoryGirl.create(:course) }
  let(:subj) { FactoryGirl.create(:subject) }

  before do
    user.save
    course.save
    subj.save
    visit root_path
  end

  def log_in
    visit new_session_path
    fill_in 'email', :with => user.email
    fill_in 'password', :with => 'foobar'
    click_button 'Log in'
  end

  describe "The navigation bar" do

    it "should have a link to all subjects" do
      click_link "Subjects"
      page.should have_content "Course Index By Subject"
    end

    it "should have a link to all courses" do
      click_link "Courses"
      page.should have_content "All Courses"
    end

    context "search box in the navbar" do
      it "should return a search result" do
        fill_in 'query', :with => course.name
        click_button 'search'
        page.should have_content course.name
      end
    end

    context "logged in" do
      before { log_in }

      it "should have a logout link in the nav bar" do
        click_link "Aberdeen Course Catalogue"
        click_link "Log out"
        page.should have_content "out"
      end

      it "should have a link to the user page in the nav bar" do
        click_link user.name
        page.should have_selector('title', :text => user.name)
      end   
    end

    context "not logged in" do
    end

  end
end

