describe Link do
  it { should belong_to :user }
  it { should validate_presence_of :url }

  # def self.featured(user)
  #   if user.links.count > 3
  #     oldest = user.links.oldest_first.first
  #     newest = user.links.newest_first.first
  #     random = random_link([oldest.url, newest.url], user)
  #     [oldest, newest, random].shuffle
  #   else
  #     []
  #   end
  # end

  # def self.random_link(urls, user)
  #   user.links.random.where.not(url: urls).first
  # end

  describe ".random_link" do
    it "should return a link that is not one of the ones passed into the argument" do
      link_1 = create(:link)
      link_2 = create(:link)
      link_3 = create(:link)
      link_4 = create(:link)
      expect(random_link([link_1], link_1.user)).to_not eq(link_1)
    end
  end
end
