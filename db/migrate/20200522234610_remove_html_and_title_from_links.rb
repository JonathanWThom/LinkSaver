class RemoveHtmlAndTitleFromLinks < ActiveRecord::Migration[5.2]
  def change
    remove_column :links, :html_preview
    remove_column :links, :title
  end
end
