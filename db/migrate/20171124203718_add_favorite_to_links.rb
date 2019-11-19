# typed: true
class AddFavoriteToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :favorite, :boolean, default: false 
  end
end
