class CreateTemporaryColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :tmp_address, :string
    add_column :links, :tmp_html, :text
    add_column :links, :tmp_page_title, :string
  end
end
