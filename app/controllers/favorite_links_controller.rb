# typed: true
class FavoriteLinksController < ApplicationController
  before_action :get_link, only: [:update]

  def index
    @links = Link.favorites(current_user)
  end

  def update
    if @link.favorite
      @link.update(favorite: false)
    else
      @link.update(favorite: true)
    end

    respond_to do |format|
      format.js { render layout: false }
      format.html { redirect_to links_path(current_user) }
    end
  end

  private

  def get_link
    @link ||= current_user.links.find(params[:id])
  end
end
