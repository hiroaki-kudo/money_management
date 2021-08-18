class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :parent_or_child
      t.string :password_digest
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
