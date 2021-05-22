class AddIndexForUsersOnTags < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, :user_id
    add_foreign_key :tags, :users
  end
end
