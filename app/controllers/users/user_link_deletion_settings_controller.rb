# typed: true
class Users::UserLinkDeletionSettingsController < ApplicationController
  def update
    if current_user.delete_links
      current_user.update(delete_links: false)
    else
      current_user.update(delete_links: true)
    end

    redirect_to user_settings_path(current_user)
  end
end
