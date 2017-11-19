class Link < ActiveRecord::Base
  validates :url, presence: true, url: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
end
