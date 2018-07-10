describe LinkSearchesController do
  attr_reader :user

  before(:each) do
    @user = create(:user)
  end

  describe "POST link_searches#create", type: :request do
    it "will succeed" do
      post link_searches_path(as: user), params: { link_search: {search: "twitter"} }
      expect(response.status).to eq 200
    end
  end
end
