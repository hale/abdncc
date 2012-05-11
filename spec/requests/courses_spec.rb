require 'spec_helper'

describe "Courses" do
  let(:course) { FactoryGirl.create(:course) }
  before{ course.save }

  describe "the root url" do
    before { visit root_path }
    it "should have a link to all courses" do
      click_link "Courses"
      page.should have_content "All Courses"
    end

    context "search box in the navbar" do
      it "should return a search result" do
        visit root_url
        fill_in 'query', :with => course.name
        click_button 'search'
        page.should have_content course.name
      end
    end

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


  end 

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
    end

  end



end
