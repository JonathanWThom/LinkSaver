class AddSlugsToUsers < ActiveRecord::Migration[5.1]
  def up
    User.all.each do |user|
      user.create_slug
      user.save!
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
