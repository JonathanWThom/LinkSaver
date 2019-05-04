require "nokogiri"
require "open-uri"

class TitleScraperJob < ApplicationJob
  def perform(link_id)
    link = Link.find(link_id)
    page = Nokogiri::HTML(open(link.url, UserAgent.new.run))
    title = page.css("title")[0].text
    link.update(title: title)
  end
end
