# frozen_string_literal: true

class Link < ActiveRecord::Base
  include Csvable

  attr_encrypted :address, key: Rails.application.credentials[:link_address_secret_key]
  attr_encrypted :html, key: Rails.application.credentials[:link_html_secret_key]
  attr_encrypted :page_title, key: Rails.application.credentials[:link_page_title_secret_key]

  belongs_to :user
  has_many :categories
  has_many :tags, through: :categories

  validates :address, presence: true, url: true

  scope :newest_first, -> { order(created_at: :desc) }
  scope :oldest_first, -> { order(created_at: :asc) }
  scope :random, -> { order(Arel.sql("RANDOM()")) }
  scope :one_month_old, -> { where("updated_at < ?", 1.month.ago) }
  scope :favorites, ->(user) { where(favorite: true).where(user_id: user.id) }
  scope :non_favorites, -> { where(favorite: false) }

  paginates_per 10

  def self.search(query, user)
    where(user: user).where.not(encrypted_page_title: nil).select do |link|
      [link.page_title, link.address].any? { |text| Regexp.new(query, "i") =~ text }
    end
  end

  def self.featured(user)
    if user.links.count > 3
      oldest = user.links.oldest_first.first
      newest = user.links.newest_first.first
      random = random_link([oldest.address, newest.address], user)
      [oldest, newest, random].shuffle
    else
      []
    end
  end

  def self.random_link(addresses, user)
    user.links.select { |link| addresses.exclude?(link.address) }.sample
  end

  def title_or_address
    page_title || address
  end

  def reading_time
    html.reading_time :format => :approx
  end
end
