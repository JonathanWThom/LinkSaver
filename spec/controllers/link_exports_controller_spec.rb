# frozen_string_literal: true

describe LinkExportsController, type: :request do
  describe "GET /link_exports" do
    let(:link_owner) { create(:user) }
    let(:current_user) { link_owner }
    let!(:link) { create(:link, user: link_owner) }

    before do
      get link_exports_path(as: current_user, format: :csv)
    end

    it "is successful" do
      expect(response.status).to eq 200
    end

    it "returns csv of links" do
      expect(response.body).to include link.address
    end
  end
end
