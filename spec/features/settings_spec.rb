# frozen_string_literal: true

feature "settings", type: :feature do
  let(:user) { create(:user) }
  before do
    visit user_settings_path(user, as: user)
  end

  scenario "export link is present" do
    expect(page).to have_link("export", href: link_exports_path(format: :csv))
  end

  scenario "delete account link is present" do
    expect(page).to have_link("delete account", href: user_path(user))
  end
end
