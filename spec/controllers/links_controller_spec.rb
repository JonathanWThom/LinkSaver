describe LinksController do
  attr_reader :user

  before(:each) do
    @user = create(:user)
  end

  describe "GET links#index", type: :request do
    it "will succeed" do
      get links_path(user, as: user)
      expect(response.status).to eq(200)
    end

    it "will redirect a non logged in user" do
      get links_path(user)
      expect(response.status).to eq(302)
    end

    it "will succeed with oldest params" do
      get links_path(user, as: user, oldest: true)
      expect(response.status).to eq(200)
    end
  end

  describe "POST links#create", type: :request do
    before(:each) do
      stub_nokogiri
      get links_path(as: user)
    end

    it "will succeed with good params" do
      expect {
        post "/links", params: { link: {url: "http://helloworld.com"} }
      }.to change(Link, :count)
    end

    it "will fail with bad params" do
      expect {
        post "/links", params: { link: {url: ""} }
      }.to_not change(Link, :count)
    end

    it "will redirect" do
      post "/links", params: { link: {url: "http://helloworld.com"} }
      expect(response.status).to eq(302)
    end
  end

  describe "GET links#show", type: :request do
    before(:each) do
      link = create(:link, user: user)
      get link_path(link, as: user)
    end

    it "will succeed with good params" do
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE links#destroy", type: :request do
    before(:each) do
      link = create(:link, user: user)
      delete link_path(link, as: user)
    end

    it "will delete the link" do
      expect(Link.count).to eq(0)
    end

    it "will redirect" do
      expect(response.status).to eq(302)
    end
  end
end
