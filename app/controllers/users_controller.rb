class UsersController < ApplicationController
  def show
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
end
