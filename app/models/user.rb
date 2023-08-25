class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :instruments, dependent: :destroy

  validates :first_name, :last_name, :city, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  def coordinates
    [latitude, longitude] if attributes.values_at("latitude", "longitude").all?
  end
end
