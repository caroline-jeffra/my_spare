class Instrument < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope(
    :search,
    against: %i[model brand category description city],
    using: {
      tsearch: { prefix: true }
    }
  )

  validates :category, :daily_price, :image_url, :city, presence: true
  validates :daily_price, numericality: { greater_than: 0 }

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

<<<<<<< HEAD
  def coordinates
    [latitude, longitude] if attributes.values_at("latitude", "longitude").all?
=======
  def self.unavailable_between(start_date, end_date)
    joins(:bookings).merge(Booking.overlapping(start_date, end_date))
  end

  def self.available_between(start_date, end_date)
    where.not(id: unavailable_between(start_date, end_date).pluck(:id))
>>>>>>> 3ab3aa4a576ba1ff554339b48200bbf776dcbd4b
  end
end
