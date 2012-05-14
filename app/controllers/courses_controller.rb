class CoursesController < ApplicationController

  def show
    @course = Course.find params[:id]
    @comment = Comment.new
    unless current_user
      flash[:notice] = "Create an account or log in to start tracking this course"
    end
  end

  def index
    if params[:query]
      @courses = Course.search params[:query]
    else
      @courses = Course.all
    end
  end
end
