require 'spec_helper'
require 'ap'

describe "Courses" do
  let(:course) { FactoryGirl.create(:course) }
  subject { course }
  before{ course.save }

  describe "the course page" do
    before { visit course_path course }

    it "title is the course name" do
      page.should have_selector('title', :text => "#{course.name}")
    end

    describe "course attributes" do
      subject { page }



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
