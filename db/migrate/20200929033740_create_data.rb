class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.string :detected_ble_address, null: false
      t.integer :rssi #将来的にnull: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
