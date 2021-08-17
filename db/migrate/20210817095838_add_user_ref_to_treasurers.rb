class AddUserRefToTreasurers < ActiveRecord::Migration[5.2]
  def change
    add_reference :treasurers, :user, foreign_key: true
  end
end
