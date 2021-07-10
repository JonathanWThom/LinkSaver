# frozen_string_literal: true

require "open-uri"
require "base64"

class SafeLinkClient
  def initialize(address)
    @address = address
  end

  def unsafe?
    return false if safe_link_api_uri.blank?

    begin
      result = URI.open(url).read
      !JSON.parse(result)["allow"]
    rescue => e
      Rails.logger.error(e)
      false
    end
  end

  private

  attr_reader :address

  def safe_link_api_uri
    @_safe_link_api_uri ||= Rails.application.credentials[Rails.env.to_sym][:safe_link_api_uri]
  end

  def encoded_address
    Base64.encode64(address)
  end

  def url
    "#{safe_link_api_uri}?url=#{encoded_address}"
  end
end
