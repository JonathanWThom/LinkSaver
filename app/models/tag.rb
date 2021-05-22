# frozen_string_literal: true

class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :links, through: :categories
  validates :title, presence: true
  validates_uniqueness_of :color, :title, scope: :user
end
