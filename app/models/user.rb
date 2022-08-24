class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :gears
  has_many :bookings

  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }
  validates :date_of_birth, presence: true
  validates :phone_number, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
