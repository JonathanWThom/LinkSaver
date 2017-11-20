class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, url: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :random, -> { order("RANDOM()") }

  paginates_per 10

  def self.featured(user)
    if user.links.count > 3
      oldest = user.links.oldest_first.first
      newest = user.links.newest_first.first
      random = random_link([oldest.url, newest.url], user)
      [oldest, newest, random].shuffle
    else
      []
    end
  end

  def self.random_link(urls, user)
    user.links.random.where.not(url: urls).first
  end
end
