class Log < ApplicationRecord
  belongs_to :user

  validates :detected_ble_token, presence: true, format: { with: User::VALID_TOKEN_REGEX }
  validates :rssi              , presence: true
  validates :txpower           , presence: true
end
