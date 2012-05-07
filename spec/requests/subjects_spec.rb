require 'spec_helper'

describe "Subjects" do
  let(:subj) { FactoryGirl.create(:subject) }
  before { subj.save }

  describe "show.html.erb the subject page" do
    before { visit subject_path subj }
    subject { page }

    it { should have_selector 'title', :text => "#{subj.name}"}

    it "displays the subject name" do
      within "body" do
        page.should have_content "#{subj.name}"
      end
    end

    describe "internal page navigation" do
      subject { page }
      it { should have_selector ".contents"}

      it "links to Level 1 courses" do
        pending "[Course content page]"
        within ".contents" do
          click_link "Level One"
          # current_url.should == subject_path( subj ) + '#level1'
        end
      end

      it "doesn't link to level 4 if the subject only has courses up to level 3" do
        pending "[Course content page]"
      end
    end

    it "displays a list of courses" do
      page.should have_selector '.courses'
    end

    describe "a course in the list" do
      let(:course) { subj.courses.first }
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

    end

  end

  describe "index.html.erb the list of all subjects" do
    before { visit subjects_path }
    subject { page }

    it { should have_selector 'title', text: 'Catalogue of Courses (Undergraduate)'}
    it { should have_content "Course Index By Subject"}

    describe "the list of courses" do
      before { visit subjects_path }
      subject { page }
      it { should have_selector '.subjects' }
      it { should have_selector '.subject' }

      describe "a subject in the list" do
        subject { page.find(".subject") }
        it { should have_content "#{subj.name}" }
        it { should have_content "#{subj.code}"}

        it "links the to the subject page" do
          click_link "#{subj.name}"
          page.should have_selector 'title', text: subj.name
        end
      end
    end

  end
end
