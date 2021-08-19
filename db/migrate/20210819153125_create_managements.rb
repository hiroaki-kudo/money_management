class CreateManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :managements do |t|
      t.integer :pocket_money, default: 3000
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
