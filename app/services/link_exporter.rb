# frozen_string_literal: true

class LinkExporter
  def initialize(user)
    @user = user
  end

  def call
    links.to_csv(*fields)
  end

  private

  def fields
    %i(created_at page_title address favorite public)
  end

  def links
    @user.links.order(created_at: :asc)
  end
end
