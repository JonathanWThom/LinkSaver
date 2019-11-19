# typed: true
class HomeController < ApplicationController
  skip_before_action :require_login
  before_action :redirect_logged_in_user, if: :current_user

  def index
  end

  private

  def redirect_logged_in_user
    redirect_to links_path
  end
end
