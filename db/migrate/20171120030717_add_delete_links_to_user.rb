class AddDeleteLinksToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :delete_links, :boolean, default: true
  end
end
