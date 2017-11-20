class LinksController < ApplicationController
  def index
    if params[:oldest]
      @links = current_user.links.oldest_first.page params[:page]
    else
      @links = current_user.links.newest_first.page params[:page]
    end
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.valid?
      PageContentBuilder.new(@link.id).run
      flash[:notice] = "Link added"
    else
      flash[:error] = "Invalid URL"
    end

    redirect_to links_path
  end

  def show
    @link = Link.find(params[:id])
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
