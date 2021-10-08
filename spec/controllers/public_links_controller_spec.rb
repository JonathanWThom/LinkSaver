# frozen_string_literal: true

describe Users::PublicLinksController, type: :request do
  describe "GET /users/:slug" do
    subject { response.status }
    let(:user_id) { create(:user).id }

    before do
      get user_links_path(user_id: user_id)
    end

    it { is_expected.to eq 200 }

    context "slug doesn't exist" do
      let(:user_id) { "foo" }

      it { is_expected.to eq 404 }
    end
  end
end

