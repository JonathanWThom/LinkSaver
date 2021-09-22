# frozen_string_literal: true

class LinkExportsController < ApplicationController
  def index
    csv = LinkExporter.new(current_user).call
    respond_to do |format|
      format.csv { send_data csv, filename: "linksaver-export-#{Time.current}.csv" }
    end
  end
end
