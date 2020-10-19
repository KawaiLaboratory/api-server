class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :detected_ble_token, null: false
      t.integer :rssi, null: false
      t.integer :txpower, null: false

      t.timestamps
    end
  end
end
