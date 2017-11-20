require "nokogiri"
require "open-uri"

class PageScraperJob < ApplicationJob
  def perform(link_id)
    link = Link.find(link_id)
    page = Nokogiri::HTML(open(link.url))
    html = page.css("body" ).to_html
    link.update(html_preview: html)
  end
end
