class LinksController < ApplicationController
  def index
    if params[:oldest]
      @links = Link.oldest_first
    else
      @links = Link.newest_first
    end
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

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
