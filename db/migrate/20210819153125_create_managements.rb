class CreateManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :managements do |t|
      t.integer :pocket_money, default: 3000

      t.timestamps
    end
  end
end
