class UsersController < ApplicationController
  def new
    @user = User.new
  end

#  CURRENTLY UNTESTED!
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user.id), :notice => "Account created.  Welcome #{@user.name}!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find params[:id]
  end
end
