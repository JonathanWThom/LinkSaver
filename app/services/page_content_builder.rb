class PageContentBuilder
  attr_reader :link_id

  def initialize(link_id)
    @link_id = link_id
  end

  def run
    TitleScraperJob.perform_later(link_id)
    PageScraperJob.perform_later(link_id)
  end
end
