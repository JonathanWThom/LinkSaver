# frozen_string_literal: true

module LinkHelper
  def random_link_path
    current_user.links.random.first.address
  end

  def link_count
    @_link_count ||= current_user.links.count
  end
end
