class AddPublicToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :public, :boolean, default: false
    add_index :links, :public
  end
end
