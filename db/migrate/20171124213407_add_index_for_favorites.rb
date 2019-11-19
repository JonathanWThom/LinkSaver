# typed: true
class AddIndexForFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :links, :favorite
  end
end
