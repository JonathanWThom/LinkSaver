# typed: true
class FeaturedLinksController < ApplicationController
  def index
    @links = Link.featured(current_user)
  end
end
