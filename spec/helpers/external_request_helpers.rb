# frozen_string_literal: true

module ExternalRequestHelpers
  HELLO_WORLD_ADDRESS = "https://helloworld.com"

  def stub_hello_world_response
    stub_request(:any, Regexp.new(HELLO_WORLD_ADDRESS)).to_rack(FakeHelloWorldResponse)
  end

  def stub_allowed_link_response
    safe_link_response(200, { allow: true })
  end

  def stub_disallowed_link_response
    safe_link_response(200, { allow: false })
  end

  def stub_failed_allowed_link_response
    safe_link_response(500, {})
  end

  private

  def safe_link_response(status, body)
    stub_request(
      :get,
      /fake-api.com\/allow\/*/
    ).to_return(
      status: status,
      body: body.to_json,
    )
  end
end
