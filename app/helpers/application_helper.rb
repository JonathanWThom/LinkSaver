module ApplicationHelper
  def random_link_path
    Link.random.first.url
  end
end
