class UsersController < ApplicationController
  def index
    @users = User.select("id, username").where("username like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @users.map { |user| {'id' => user.id, 'name' => user.username} } }
    end
  end
end

