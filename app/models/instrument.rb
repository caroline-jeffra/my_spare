class Instrument < ApplicationRecord
  belongs_to :user

  validates :category, :daily_price, :image_url, :city, presence: true
  validates :daily_price, numericality: { greater_than: 0 }

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
