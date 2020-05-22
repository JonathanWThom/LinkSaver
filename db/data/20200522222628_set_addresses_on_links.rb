class SetAddressesOnLinks < ActiveRecord::Migration[5.2]
  def up
    Link.all.each do |link|
      link.address = link.url
      link.save!
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
