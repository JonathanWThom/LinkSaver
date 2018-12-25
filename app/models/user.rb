class User < ApplicationRecord
  include Clearance::User

  has_many :links
  has_many :tags

  validates_uniqueness_of :display_name

  scope :deletion_on, -> { where(delete_links: true) }

  # presenter?
  def public_url
    if display_name
      display_name.parameterize
    else
      mail = Mail::Address.new(email)
      mail.local.parameterize
    end
  end

  # def self.find(input)
  #   input.to_i == 0 ? find_by(title: input) : super
  # end

  def to_param
    public_url
  end
end
