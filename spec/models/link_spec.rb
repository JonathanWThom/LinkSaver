describe Link do
  it { should belong_to :user }
  it { should validate_presence_of :url }

  describe ".featured" do
    attr_reader :user, :link_5

    before do
      @user = create(:user)
      link_1 = create(:link, user: user)
      link_2 = create(:link, user: user)
      link_3 = create(:link, user: user)
      link_4 = create(:link, user: user)
      @link_5 = create(:link)
    end

    it "should return three featured links" do
      expect(Link.featured(user).count).to eq(3)
    end

    it "should not include links from other users" do
      expect(Link.featured(user)).to_not eq(link_5)
    end
  end

  def self.featured(user)
    if user.links.count > 3
      oldest = user.links.oldest_first.first
      newest = user.links.newest_first.first
      random = random_link([oldest.url, newest.url], user)
      [oldest, newest, random].shuffle
    else
      []
    end
  end

  describe ".random_link" do
    attr_reader :user, :link_1, :link_5

    before do
      @user = create(:user)
      link_1 = create(:link, user: user)
      link_2 = create(:link, user: user)
      link_3 = create(:link, user: user)
      link_4 = create(:link, user: user)
      @link_5 = create(:link)
    end

    it "should return a link that is not one of the ones passed into the argument" do
      user = create(:user)
      link_1 = create(:link, user: user)
      link_2 = create(:link, user: user)
      link_3 = create(:link, user: user)
      link_4 = create(:link, user: user)
      expect(Link.random_link([link_1], user)).to_not eq(link_1)
    end

    it "should not return a link that does not below to the user" do
      expect(Link.random_link([], user)).to_not eq(link_5)
    end
  end
end
