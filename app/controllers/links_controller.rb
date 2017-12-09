class LinksController < ApplicationController
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

#     $.ajax({
#   dataType: "json",
#   url: "http://localhost:3000/links",
#   method: "GET",
#   headers: { "Authorization" :"auth_token"},
# }).done(function(data) {console.log(data)});
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
      respond_to do |format|
        format.html { redirect_to links_path }
        format.json { render json: @link.errors, status: :bad_request }
      end
    end

#     $.ajax({
#   dataType: "json",
#   url: "http://localhost:3000/links",
#   method: "POST",
#   headers: { "Authorization" :"auth_token"},
#   data: {link: {url: "https://www.google.com"}}
# }).done(function(data) {console.log(data)});
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
