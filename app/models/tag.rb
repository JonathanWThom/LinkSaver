# typed: false
class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :links, through: :categories
  validates :title, presence: true
  validates_uniqueness_of :color, :title, scope: :user

  def rgb
    color[1..-1].scan(/../).map {|color| color.to_i(16)}.join(",")
  end

  def style
    "border: 1px solid #{color}; background-color: rgba(#{rgb}, .5);"
  end

  def circle_style(link)
    style = "border: 1px solid #{color};"
    if self.links.include?(link)
      style + "background-color: rgba(#{rgb}, .5);"
    else
      style
    end
  end
end
