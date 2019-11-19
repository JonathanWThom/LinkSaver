# typed: true
class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Response
  include ExceptionHandler
  protect_from_forgery with: :exception, unless: :json_request?
  before_action :require_login, unless: :json_request?
  before_action :authorize_request, if: :json_request?

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  def json_request?
    request.format.json?
  end
end
