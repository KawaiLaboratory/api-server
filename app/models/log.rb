class Log < ApplicationRecord
  belongs_to :user

  validates :detected_ble_address, presence: true, format: { with: User::VALID_MAC_REGEX }
  validates :rssi                , presence: true
end
