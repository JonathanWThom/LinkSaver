# frozen_string_literal: true

class TagPresenter < SimpleDelegator
  def self.wrap(tags)
    tags.map { |tag| self.new(tag) }
  end

  def circle_style(link)
    style = "border: 1px solid #{color};"
    if self.links.include?(link)
      style + "background-color: rgba(#{rgb}, .5);"
    else
      style
    end
  end

  def style
    "border: 1px solid #{color}; background-color: rgba(#{rgb}, .5);"
  end

  private

  def rgb
    color[1..-1].scan(/../).map {|color| color.to_i(16)}.join(",")
  end
end
