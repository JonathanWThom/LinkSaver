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
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:display_name)
  end
end
