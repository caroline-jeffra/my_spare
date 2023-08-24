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

  def bookings_strings
    bookings.pluck(:start_date, :end_date).map do |i|
      [i.first.strftime("%Y-%m-%d"), i.last.strftime("%Y-%m-%d")]
    end
  end

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
