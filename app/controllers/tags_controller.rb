# typed: false
class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :destroy]

  def create
    tag = current_user.tags.create(tag_params)

    if tag.valid?
      flash[:notice] = "Tag added"
    else
      flash[:error] = tag.errors.full_messages.first
    end

    redirect_to links_path
  end

  def show
    @links = @tag.links
  end

  def destroy
    @tag.destroy
    redirect_to links_path
  end

  private

  def find_tag
    @tag = Tag.find_by_id(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title, :color)
  end
end
