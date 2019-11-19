# typed: true
class AddTitleIndexToLinks < ActiveRecord::Migration[5.2]
  def change
    add_index :links, :title
  end
end
