describe HomeController do
  describe "GET home#index", type: :request do
    it "will succeed" do
      get root_path
      expect(response.status).to eq(200)
    end

    it "will redirect a logged in user" do
      user = create(:user)
      get root_path(as: user)
      expect(response.status).to eq(302)
    end
  end
end
