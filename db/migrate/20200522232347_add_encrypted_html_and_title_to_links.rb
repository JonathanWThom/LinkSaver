class AddEncryptedHtmlAndTitleToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :encrypted_html, :string
    add_column :links, :encrypted_html_iv, :string
    add_column :links, :encrypted_page_title, :string
    add_column :links, :encrypted_page_title_iv, :string
  end
end
