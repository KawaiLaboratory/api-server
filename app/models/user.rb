# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_MAC_REGEX   = /\A(?:[0-9a-fA-F]{2}\-){5}[0-9a-fA-F]{2}\z/i

  has_many :logs

  validates :email      , presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :ble_address, presence: true, format: { with: VALID_MAC_REGEX }
  validates :name       , presence: true
  validates :nickname   , presence: false

  attribute :name       , :string, default: -> {"anonymous"}
  attribute :nickname   , :string, default: -> {"John Doe"}
end
