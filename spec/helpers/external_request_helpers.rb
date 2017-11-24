module ExternalRequestHelpers
    # stub_request(:any, /api.github.com/).to_rack(FakeGitHub)
  def stub_nokogiri
    stub_request(:any, "/helloworld.com/").to_rack(FakeNokogiriResponse)
  end
end
