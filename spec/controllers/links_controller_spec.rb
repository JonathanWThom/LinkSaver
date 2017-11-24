describe LinksController do
  describe "GET links#index", type: :request do
    it "will succeed" do
      user = create(:user)
      get links_path(user, as: user)
      expect(response.status).to eq(200)
    end

    it "will redirect a non logged in user" do
      user = create(:user)
      get links_path(user)
      expect(response.status).to eq(302)
    end

    it "will succeed with oldest params" do
      user = create(:user)
      get links_path(user, as: user, oldest: true)
      expect(response.status).to eq(200)
    end
  end

  describe "POST links#create", type: :request do
    it "will succeed with good params" do
      stub_nokogiri
      user = create(:user)
      link_attributes = FactoryGirl.attributes_for(:link, user: user)
      get links_path(as: user)

      expect {
        post "/links", params: { link: {url: "http://helloworld.com"} }
      }.to change(Link, :count)

    end

    # it "will redirect to links path" do
    #   user = create(:user)
    #   get links_path(user, as: user, oldest: true)
    #   expect(response.status).to eq(200)
    # end
  end


  # def create
  #   @link = current_user.links.create(link_params)
  #   if @link.valid?
  #     PageContentBuilder.new(@link.id).run
  #     flash[:notice] = "Link added"
  #   else
  #     flash[:error] = "Invalid URL"
  #   end
  #
  #   redirect_to links_path
  # end
  #
  # def show
  #   @link = Link.find(params[:id])
  # end
  #
  # def destroy
  #   @link = Link.find(params[:id])
  #   @link.destroy
  #
  #   redirect_to links_path
  # end
end
