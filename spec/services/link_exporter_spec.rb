# frozen_string_literal: true

describe LinkExporter do
  describe "#call" do
    let(:user) { create(:user) }
    let!(:fav_link) { create(:link, favorite: true, user: user) }
    let!(:pub_link) { create(:link, public: true, user: user) }
    let!(:other_user_link) { create(:link) }
    let(:expected_csv) do
      "created_at,page_title,address,favorite,public\n" +
      "#{fav_link.created_at},#{fav_link.page_title},#{fav_link.address},true,false\n" +
      "#{pub_link.created_at},#{pub_link.page_title},#{pub_link.address},false,true\n"
    end

    subject { described_class.new(user).call }

    it { is_expected.to eq expected_csv }
  end
end
