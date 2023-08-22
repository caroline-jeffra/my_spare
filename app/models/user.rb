class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :instruments

  validates :first_name, :last_name, :city, presence: true
  validates :first_name, :last_name, :city, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

end
