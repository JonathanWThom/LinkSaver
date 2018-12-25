class User < ApplicationRecord
  include Clearance::User
  include Sluggable

  has_many :links
  has_many :tags

  validates_uniqueness_of :display_name

  scope :deletion_on, -> { where(delete_links: true) }
end
