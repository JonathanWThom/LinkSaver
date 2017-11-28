class User < ApplicationRecord
  include Clearance::User
  has_many :links
  has_many :tags

  scope :deletion_on, -> { where(delete_links: true) }
end
