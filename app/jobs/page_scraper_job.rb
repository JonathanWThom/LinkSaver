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

  def get_page
    open(url, UserAgent.new.run)
  end

  def parse_html
    get_page.read
  end

  def parse_pdf
    reader = PDF::Reader.new(get_page)
    reader.pages.map do |page|
      page.text
    end.join
  end
end
