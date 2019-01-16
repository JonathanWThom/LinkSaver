class ColorModesController < ApplicationController
  skip_before_action :authorize_request, :require_login

  def update
    if cookies[:dark_mode]
      cookies.delete(:dark_mode)
    else
      cookies[:dark_mode] = true
    end

    redirect_back fallback_location: links_path
  end
end
