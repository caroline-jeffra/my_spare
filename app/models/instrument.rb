class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[model brand category description city],
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :category, :daily_price, :image_url, :city, presence: true
  validates :daily_price, numericality: { greater_than: 0 }

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  def coordinates
    [latitude, longitude] if attributes.values_at("latitude", "longitude").all?
  end
end
