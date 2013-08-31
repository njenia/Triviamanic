class RegistrationsController < Devise::SessionsController
  def new
    @user = User.new
    render 'devise/registrations/new'
  end
  def create
    username = params[:username]

    @user = User.new(:username => username)
  end
end

