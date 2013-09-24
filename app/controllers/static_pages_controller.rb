class StaticPagesController < ApplicationController

  def main
    @user = current_user
  end

  def cancel_bootcamp_notice
    current_user.bootcamp_notice_cancelled = true;
    current_user.save!

    render :nothing => true
  end
end

