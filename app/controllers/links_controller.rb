class LinksController < ApplicationController
  def index
    @links = Link.newest_first
  end

  def create
  end
end
