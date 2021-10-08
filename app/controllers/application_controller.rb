# typed: true
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
