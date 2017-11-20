class Link < ActiveRecord::Base
  validates :url, presence: true, url: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :random, -> { order("RANDOM()") }

  paginates_per 10

  def self.featured
    if Link.count > 3
      oldest = Link.oldest_first.first
      newest = Link.newest_first.first
      random = random_link([oldest.url, newest.url])
      [oldest, newest, random].shuffle
    else
      []
    end
  end

  def self.random_link(urls)
    Link.random.where.not(url: urls).first
  end
end
