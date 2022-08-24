class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :sport_type, presence: true
  validates :gear_type, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :amount, presence: true
end
