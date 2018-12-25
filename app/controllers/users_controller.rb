class UsersController < ApplicationController
  skip_before_action :require_login, :authorize_request, only: [:show]

  def update
    if current_user.update(user_params)
      flash[:notice] = "User updated"
    else
      flash[:error] = current_users.errors.full_messages.to_sentence
    end

    redirect_to links_path
  end

  def show
    # User.includes(:public_links).find(params[:id]) does not seem to hit the custom
    # find method from Sluggable for some reason
    @user = User.find(params[:id])
    @links = @user.public_links
  end

  private

  def user_params
    params.require(:user).permit(:display_name)
  end
end
