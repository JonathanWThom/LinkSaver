class LinksController < ApplicationController
  before_action :get_link, only: [:show, :destroy, :update]

  def index
    if params[:oldest]
      @links = current_user.links.oldest_first.page params[:page]
    else
      @links = current_user.links.newest_first.page params[:page]
    end

    @tags = current_user.tags

    respond_to do |format|
      format.html
      format.json { render json: @links, status: 200 }
    end
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.valid?
      PageContentBuilder.new(@link.id).run
      flash[:notice] = "Link added"
      respond_to do |format|
        format.html { redirect_to links_path }
        format.json { render json: @link.to_json, status: :created }
      end
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
        respond_to do |format|
          format.html { redirect_to links_path }
          format.json { render json: @link.to_json, status: :ok }
        end
      else
        flash[:error] = "Link failed to update"
        bad_request
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def get_link
    @link ||= current_user.links.find(params[:id])
  end

  def bad_request
    respond_to do |format|
      format.html { redirect_to links_path }
      format.json { render json: @link.errors, status: :bad_request }
    end
  end
end
