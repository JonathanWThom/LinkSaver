# typed: true
class CategoriesController < ApplicationController
  before_action :find_category

  def create
    if category.present?
      category.destroy
    else
      Category.create(link_id: link_id, tag_id: tag_id)
    end

    @link = Link.find(link_id)

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  attr_reader :category, :link_id, :tag_id

  def link_id
    @link_id = params[:link_id]
  end

  def tag_id
    @tag_id = params[:tag_id]
  end

  def find_category
    @category = Category.where(link_id: link_id).where(tag_id: tag_id).first
  end
end
