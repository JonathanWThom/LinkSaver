require "nokogiri"
require "open-uri"

class PageScraperJob < ApplicationJob
  def perform(link_id)
    link = Link.find(link_id)
    @url = link.url

    if File.extname(url) == ".pdf"
      preview = parse_pdf
    else
      preview = parse_html
    end

    link.update(html_preview: preview)
  end

  private

  attr_reader :url

  def parse_html
    page = Nokogiri::HTML(open(url))
    page.css("body").to_html
  end

  def parse_pdf
    io = open(url)
    reader = PDF::Reader.new(io)
    text = ""
    reader.pages.each do |page|
      text.concat(page.text)
    end

    text
  end
end
