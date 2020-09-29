class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :detected_ble_address
      t.integer :rssi

      t.timestamps
    end
  end
end
