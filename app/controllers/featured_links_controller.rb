class FeaturedLinksController < ApplicationController
  def index
    @links = Link.featured
  end
end
