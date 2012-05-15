require 'spec_helper'

describe "Courses" do
  include Helpers

  let(:course) { FactoryGirl.create(:course) }
  let(:course_with_comments) { FactoryGirl.create(:course_with_comments) }
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
    end # /context unkown user

    #    BOOKMARKS     it { should have_content "Sign up or log in now to track this ourse for later!"}

    describe "course comments" do
      # let(:course_with_comments) { FactoryGirl.create(:course_with_comments) }
      before { visit course_path course_with_comments }

      subject { page }

      it { should have_selector '.comments' }
      it { should have_selector '.comment' }

      it { should have_content 'Comments' }

      describe "a comment in the list" do
        let(:comment) { course_with_comments.comments.first }
        subject { page.find('.comment') }

        it { should have_content "#{comment.user.name}" }
        it { should have_content "#{comment.user.status}" }
        it { should have_content "#{comment.created_at.to_s}" }
        it { should have_content "#{comment.content}" }
      end

      describe "the 'add a new comment' button" do
        context "logged in" do
          before do
            log_in user
            visit course_path course
          end

          context "valid information" do
            before do
              fill_in 'comment_content', :with => "This is a new comment!"
              click_on "Add Comment"
            end
            it "adds a new comment to the course page" do
              page.should have_content "This is a new comment!"
            end
            it "adds the comment to the user's list of courses" do
              user.comments.should include(Comment.find_by_content 'This is a new comment!' )
            end
            it "displays a success message " do
              page.should have_content "Comment added!"
            end
          end
          context "invalid information" do
            before do
              Course.find(course).comments.delete_all
              fill_in 'comment_content', :with => ""
              click_on "Add Comment"
            end
            it "doesn't add the comment" do
              Course.find(course).comments.should be_empty
            end
            xit "displays a message about what happened" do
            end
          end
        end

        context "unknown user" do
          before do
            log_out
            visit course_path course
          end
          subject { page }
          it { should_not have_content "Add Comment"}

          it "should show a message about signing up" do
            page.should have_content "Sign up for an account to contribute"
          end
        end
      end

    end # course comments

  end # show.html

  describe "index.html.erb the listing courses page" do
    before { visit courses_path }
    subject { page }

    it { should have_selector 'title', text: "All courses" }
    it { should have_selector '.courses' }
    it { should have_selector '.course'}

    describe "a course in the list" do
      subject { page }

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
