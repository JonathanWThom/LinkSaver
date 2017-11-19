class LinksController < ApplicationController
  def index
    @links = Link.newest_first
  end

  def create
    @link = Link.create(link_params)
    if @link.valid?
      flash[:notice] = "Link added"
    else
      flash[:error] = "Invalid URL"
    end

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
