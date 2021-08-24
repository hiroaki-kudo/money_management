class AddIndexToManagementsEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :managements, :email, unique: true
  end
end
