class AddIndices < ActiveRecord::Migration[5.1]
  def change
    add_index :links, :url
    add_index :links, :created_at
    add_index :links, :updated_at
    add_index :links, :user_id
  end
end
