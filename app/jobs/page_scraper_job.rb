require "open-uri"

class PageScraperJob < ApplicationJob

  def perform(link_id)
    link = Link.find(link_id)
    @address = link.address
    return false if SafeLinkClient.new(address).unsafe?

    link.update(
      html: html,
      page_title: page_title
    )
  end

  private

  attr_reader :address

  def page
    @_page ||= URI.open(address, UserAgent.new.run)
  end

  def parse_html
    content = page.read
    page.rewind
    Readability::Document.new(content).content
  end

  def parse_pdf
    PDF::Reader.new(page).pages(&:text).join
  end

  def html
    if File.extname(address) ==  ".pdf"
      parse_pdf
    else
      parse_html
    end
  end

  def page_title
    Nokogiri::HTML(page).css("title")[0]&.text
  end
end
