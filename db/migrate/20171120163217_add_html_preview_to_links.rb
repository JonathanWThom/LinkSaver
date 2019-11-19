# typed: true
class AddHtmlPreviewToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :html_preview, :text
  end
end
