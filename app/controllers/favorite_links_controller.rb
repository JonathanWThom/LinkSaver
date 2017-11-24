class FavoriteLinksController < ApplicationController
  def index
    @links = Link.favorites(current_user)
  end

  def update
    @link = Link.find(params[:id])

    if @link.favorite
      @link.update(favorite: false)
    else
      @link.update(favorite: true)
    end

    respond_to do |format|
      format.js
      format.html { redirect_to links_path(current_user) }
    end
  end
end
