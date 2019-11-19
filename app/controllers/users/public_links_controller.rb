# typed: true
class Users::PublicLinksController < ApplicationController
  skip_before_action :require_login, :authorize_request
  def index
    # User.includes(:public_links).find(params[:id]) does not seem to hit the custom
    # find method from Sluggable for some reason
    @user = User.find(params[:user_id])
    @links = @user.public_links
  end
end
