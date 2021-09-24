# frozen_string_literal: true

describe UsersController, type: :request do
  describe "DELETE /users/:user_id" do
    let(:user) { create(:user) }
    let!(:link) { create(:link, user: user) }
    let!(:tag) { create(:tag, user: user) }
    let!(:category) { create(:category, tag: tag, link: link) }
    let(:delete!) { delete user_path(user, as: user) }

    it "redirects on completion" do
      delete!

      expect(response.status).to redirect_to(root_path)
    end

    it "deletes the user" do
      expect do
        delete!
      end.to change { User.find_by(id: user.id) }.to nil
    end

    it "deletes the user's links" do
      expect do
        delete!
      end.to change { Link.find_by(user_id: user) }.to nil
    end

    it "deletes the user's tags" do
      expect do
        delete!
      end.to change { Tag.find_by(user_id: user) }.to nil
    end

    it "deletes the user's categories (link-tag connection)" do
      expect do
        delete!
      end.to change { Category.count }.to 0
    end
  end
end
