# typed: true
class LinkDeletionWorker
  include Sidekiq::Worker

  def perform
    User.deletion_on.each do |user|
      user.links.one_month_old.non_favorites.destroy_all
    end
  end
end
