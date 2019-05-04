class PageScraperJob < ApplicationJob
  def perform(link_id)
    link = Link.find(link_id)
    @url = link.url

    link.update(
      html_preview: html_preview,
      title: title
    )
  end

  private

  attr_reader :url

  def page
    @_page ||= open(url, UserAgent.new.run)
  end

  def parse_html
    content = page.read
    page.rewind
    content
  end

  def parse_pdf
    PDF::Reader.new(page).pages(&:text).join
  end

  def html_preview
    if File.extname(url) ==  ".pdf"
      parse_pdf
    else
      parse_html
    end
  end

  def title
    Nokogiri::HTML(page).css("title")[0]&.text
  end
end
