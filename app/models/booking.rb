class Booking < ApplicationRecord
  belongs_to :gear
  belongs_to :user
  validates :check_in, :check_out, presence: true
end
