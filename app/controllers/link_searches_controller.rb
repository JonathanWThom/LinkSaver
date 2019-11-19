# typed: false
class LinkSearchesController < ApplicationController
  def create
    @search = "#{params[:link_search][:search]}"
    @links = current_user.links.search(@search)
  end
end
