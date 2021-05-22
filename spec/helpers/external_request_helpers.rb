# frozen_string_literal: true

module ExternalRequestHelpers
  HELLO_WORLD_ADDRESS = "https://helloworld.com"

  def stub_hello_world_response
    stub_request(:any, Regexp.new(HELLO_WORLD_ADDRESS)).to_rack(FakeHelloWorldResponse)
  end
end
