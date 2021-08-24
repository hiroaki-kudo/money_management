class AddManagementRefToTreasurers < ActiveRecord::Migration[5.2]
  def change
    add_reference :treasurers, :management, foreign_key: true
  end
end
