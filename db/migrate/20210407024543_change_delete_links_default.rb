class ChangeDeleteLinksDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :delete_links, false
  end
end
