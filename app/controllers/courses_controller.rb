class CoursesController < ApplicationController

  def show
    @course = Course.find params[:id]
  end

  def index
    if params[:query]
      @courses = Course.search params[:query]
    else
      @courses = Course.all
    end
  end
  
end
