class RemovePocketMoneyFromManagements < ActiveRecord::Migration[5.2]
  def change
    remove_column :managements, :pocket_money, :integer
  end
end
