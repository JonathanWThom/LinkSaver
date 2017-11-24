require "sinatra/base"

class FakeNokogiriResponse < Sinatra::Base
  get "/" do
    html_response 200, "fake_nokogiri_response.html"
  end

  private

  def html_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
