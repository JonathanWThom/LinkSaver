# typed: true
class Users::PublicLinksController < ApplicationController
  skip_before_action :require_login
  def index
    # User.includes(:public_links).find(params[:id]) does not seem to hit the custom
    # find method from Sluggable for some reason
    @user = User.find(params[:user_id])
    return not_found if @user.blank?
    @links = @user.public_links
  end
end
