# typed: strong
class AboutController < ApplicationController
  skip_before_action :require_login
end
