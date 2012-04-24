class CoursesController < ApplicationController

  def show
    @course = Course.find params[:id]
  end

  def index
    @courses = Course.all
  end
  
end
