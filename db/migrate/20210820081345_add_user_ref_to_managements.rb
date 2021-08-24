class AddUserRefToManagements < ActiveRecord::Migration[5.2]
  def change
    add_reference :managements, :parent, foreign_key: { to_table: :users }
  end
end
