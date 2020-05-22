class AddAttrEncryptedToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :encrypted_address, :string
    add_column :links, :encrypted_address_iv, :string
  end
end
