# frozen_string_literal: true

describe UsersController, type: :request do
  describe "DELETE /users/:id" do
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

  describe "PATCH /users/:id" do
    let(:update!) { patch user_path(user, as: user), params: params }

    let(:params) { { user: { display_name: new_display_name } } }
    let(:user) { create(:user) }
    let(:new_display_name) { "asdfasdf" }

    context "valid params" do

      it "updates the user" do
        expect do
          update!
        end.to change { user.reload.display_name }.to new_display_name
      end
    end

    context "invalid params" do
      before { create(:user, display_name: new_display_name) }

      it "does not update the user" do
        expect do
          update!
        end.to_not change { user.reload.display_name }
      end
    end
  end
end
