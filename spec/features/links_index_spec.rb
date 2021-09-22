# frozen_string_literal: true

feature "links index", type: :feature do
  scenario "export link is present" do
    visit links_path(as: create(:user))

    expect(page).to have_link("export", href: link_exports_path(format: :csv))
  end
end
