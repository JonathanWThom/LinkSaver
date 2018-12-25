class User < ApplicationRecord
  include Clearance::User
  include Sluggable

  has_many :links
  has_many :tags
  has_many :public_links, -> { where(public: true) }, class_name: "Link"

  validates_uniqueness_of :display_name, :email

  scope :deletion_on, -> { where(delete_links: true) }

  def human_readable_display_name
    display_name || Mail::Address.new(email).local
  end
end
