class SubjectsController < ApplicationController
  def show
    @subject = Subject.find params[:id]
  end

  def index
    @subjects = Subject.all
  end
end
