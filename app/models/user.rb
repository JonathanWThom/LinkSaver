class User < ApplicationRecord
  include Clearance::User
  has_many :links

  scope :deletion_on, -> { where(delete_links: true) }
end
