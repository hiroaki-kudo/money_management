class AddUser2RefToManagements < ActiveRecord::Migration[5.2]
  def change
    add_reference :managements, :kid, foreign_key: { to_table: :users }
  end
end
