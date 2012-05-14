class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      # handle successful creation of the comment
      redirect_to course_path params[:comment][:course_id]
    else
      redirect_to course_path params[:comment][:course_id]
      # handle non-success
    end
  end
  
end
