class AddEmailToManagements < ActiveRecord::Migration[5.2]
  def change
    add_column :managements, :email, :string
  end
end
