# typed: true
class ColorModesController < ApplicationController
  skip_before_action :authorize_request, :require_login

  def update
    if cookies[:dark_mode]
      cookies.delete(:dark_mode)
    else
      cookies.permanent[:dark_mode] = true
    end
    fallback =
      if current_user
        user_settings_path(current_user)
      else
        about_path
      end

    redirect_back fallback_location: fallback
  end
end
