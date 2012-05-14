require 'spec_helper'

describe CommentsController do
  let(:comment) { FactoryGirl.create(:comment) }
  # let(:user) { FactoryGirl.create(:user) }
  # let(:course) { FactoryGirl.create(:course) }
  before do
    comment.save
    # user.save
    # course.save
  end

  describe "POST create" do

    before { post :create, :comment => { :course_id => comment.course.id, :user_id => comment.user.id, :content => comment.content } }    

    it "adds the comment to the courses list of comments" do
      Course.find(comment.course.id).comments.should include(comment)
    end
    it "adds the comment to the ueser's list of comments" do
      User.find(comment.user.id).comments.should include(comment)
    end
    it "redirects to course_path(:id)" do
      response.should redirect_to course_path comment.course
    end
    
  end


end
