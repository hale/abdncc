require 'spec_helper'

describe "Courses" do
  include Helpers

  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }
  before do
    course.save
    user.save
  end

  describe "show.html.erb the course page" do
    before { visit course_path course }
    subject { page }

    it { should have_selector 'title', :text => "#{course.name}"}

    describe "course attributes" do
      it { should have_content "#{course.name}" }
      it { should have_content "#{course.ccode}" }
      it { should have_content "#{course.credits}" }
      it { should have_content "#{course.coordinator}" }
      it { should have_content "#{course.prereq}" }
      it { should have_content "#{course.note}" }
      it { should have_content "#{course.description}" }
      it { should have_content "#{course.assessment}" }
      it { should have_content "#{course.level}" }
      it { should have_content "#{course.subject}" }
      it { should have_content "#{course.department}" }
    end

    it "course subject name should link to subject page" do
      click_link "#{course.subject.name}"
      page.should have_selector 'title', text: course.subject.name
    end

    context "logged in" do
      before do
        log_in user
        visit course_path course
      end

      context "user has the course in their course list" do
        before { user.add_course course }
        before { visit course_path course }

        describe "the 'Remove from my Course List' button" do
          before { click_on 'Remove from my Course List' }

          it "should remove the course from the user's course list" do 
            user.should_not have_course course
          end
          it "should show a message saying the course has been removed" do
            page.should have_content "removed"
          end
        end
      end

      context "the user does not have the course in their course list" do
        before { user.remove_course course }

        describe "the 'Add to my Course List' button" do
          before { click_on( 'Add to my Course List' ) }

          it "should add the course to the user's Course List" do
            user.should have_course course
          end
          it "should show a message saying the course has been added" do
            page.should have_content "added"
          end
          it "course page should not show the 'Add to my Course List' button" do
            visit course_path course
            page.should_not have_content "Add to my Course List"
          end
        end
      end # /context

    end # /context logged in

    context "unknown user" do
      before { log_out }
      describe "the add/remove buttons" do
        subject { page }
        it { should_not have_content 'Add to my Course List' }
        it { should_not have_content 'Remove from my Course List' }
        it { should have_content 'Create an account or log in to start tracking this course' }
      end
    end

    #    BOOKMARKS     it { should have_content "Sign up or log in now to track this ourse for later!"}

  end # show.html

  describe "index.html.erb the listing courses page" do
    before { visit courses_path }
    subject { page }

    it { should have_selector 'title', text: "All courses" }
    it { should have_selector '.courses' }
    it { should have_selector '.course'}

    describe "a course in the list" do
      subject { page.find(".course") }

      describe "course attributes" do
        it { should have_content "#{course.name}" }
        it { should have_content "#{course.ccode}" }
        it { should have_content "#{course.credits}" }
        it { should have_content "#{course.coordinator}" }
        it { should have_content "#{course.prereq}" }
        it { should have_content "#{course.note}" }
        it { should have_content "#{course.description}" }
        it { should have_content "#{course.assessment}" }
        it { should have_content "#{course.level}" }
        it { should have_content "#{course.subject}" }
        it { should have_content "#{course.department}" }
      end

      it "course name links to the course page" do
        click_link "#{course.name}"
        page.should have_selector 'title', text: course.name
      end

      it "subject name links to the subject page" do
        click_link "#{course.subject}"
        page.should have_selector 'title', text: course.subject.name
      end
    end

  end



end
