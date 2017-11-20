class Users::UserLinkDeletionSettingsController < ApplicationController
  def update
    if current_user.delete_links
      current_user.update(delete_links: false)
    else
      current_user.update(delete_links: true)
    end

    redirect_to links_path
  end
end
