class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :instruments

  validates :first_name, :last_name, :city, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
