# typed: true
class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end

    create_table :categories do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :link, index: true

      t.timestamps
    end
  end
end
