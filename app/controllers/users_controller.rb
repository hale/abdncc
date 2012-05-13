class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), :notice => "Account created.  Welcome #{@user.name}!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
    # if current_user.id == @user.id 
      flash.now[:info] = "#{view_context.link_to('Account settings', edit_user_path(@user))}".html_safe
    # end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user.id), :notice => "Changes saved."
    else
      render 'edit'
    end
  end

  def add_course
    @user = User.find params[:id]
    @course = Course.find params[:course_id]
    @user.add_course @course

    redirect_to course_path(@course), :notice => "#{@course.ccode} has been added to your Course List"
  end

  def remove_course
    @user = User.find params[:id]
    @course = Course.find params[:course_id]
    @user.remove_course @course

    redirect_to course_path(@course), :notice => "#{@course.ccode} has been removed from your Course List"
  end
end
