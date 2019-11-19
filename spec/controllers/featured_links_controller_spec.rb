# typed: false
describe LinksController do
  attr_reader :user

  before(:each) do
    @user = create(:user)
    4.times do
      create(:link, user: user)
    end
  end

  describe "GET featured_links#index", type: :request do
    it "will succeed" do
      get featured_path(user, as: user)
      expect(response.status).to eq(200)
    end
  end
end
