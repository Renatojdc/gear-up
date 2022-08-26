class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :sport_type, presence: true
  validates :gear_type, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 240 }
  validates :amount, presence: true
  validates :photos, presence: true

  include PgSearch::Model
  pg_search_scope :search_location,
                  against: [:address],
                  using: {
                    tsearch: { prefix: true }
                  }
                  pg_search_scope :search_sport,
                  against: [:sport_type],
                  using: {
                    tsearch: { prefix: true }
                  }
                  pg_search_scope :search_gear,
                  against: [:gear_type],
                  using: {
                    tsearch: { prefix: true }
                  }
end
