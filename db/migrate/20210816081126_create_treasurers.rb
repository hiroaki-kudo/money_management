class CreateTreasurers < ActiveRecord::Migration[5.2]
  def change
    create_table :treasurers do |t|
      t.date :use_date_at
      t.integer :category_id
      t.string :use_what
      t.integer :use_money
      t.integer :get_money
      t.timestamps
    end
  end
end
