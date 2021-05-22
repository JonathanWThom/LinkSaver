# typed: false
class LinksController < ApplicationController
  before_action :get_link, only: [:show, :destroy, :update]

  def index
    if params[:oldest]
      @links = links.oldest_first.page params[:page]
    else
      @links = links.newest_first.page params[:page]
    end

    @tags = TagPresenter.wrap(current_user.tags)
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.valid?
      PageScraperJob.perform_later(@link.id)
      flash[:notice] = "Link added"
      redirect_to links_path
    else
      flash[:error] = "Invalid URL"
      bad_request
    end
  end

  def destroy
    @link.destroy

    redirect_back fallback_location: links_path
  end

  def update
    if params[:public]
      if @link.update(public: !@link.public)
        flash[:notice] = "Link updated"
        redirect_back fallback_location: links_path
      else
        flash[:error] = "Link failed to update"
        bad_request
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:address)
  end

  def get_link
    @link ||= current_user.links.find(params[:id])
  end

  def bad_request
    redirect_to links_path
  end

  def links
    @_links ||= current_user.links
  end
end
