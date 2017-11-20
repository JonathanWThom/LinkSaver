require "nokogiri"
require "open-uri"

class TitleScraperJob < ApplicationJob
  attr_reader :link

  def initialize(link_id)
    @link = Link.find(link_id)
  end

  def perform
    page = Nokogiri::HTML(open(link.url))
    title = page.css("title")[0].text
    link.update(title: title)
  end
end
