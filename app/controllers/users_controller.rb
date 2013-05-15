class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
    user = User.find_by_username(params[:user][:username])
    if user
      flash.now.alert = "User already exists"
      render 'new'
    else
      if params[:user][:password] == params[:user][:password_confirmation]
        user = User.new(params[:user])
        if user.save
          sign_in(user)
          flash[:success] = "Welcome, #{user.username}!"
          redirect_to root_path
        end
      else
        flash.now.alert = "Passwords do not match"
        render 'new'
      end
    end
  end

end
