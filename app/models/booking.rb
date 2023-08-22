class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  validates :start_date, :end_date, :instrument, :user, presence: true
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date
  validate :no_booking_overlap

  def self.overlapping(start_date, end_date, instrument_id)
    where "
    instrument_id = :instrument_id AND (
      (
        start_date <= :start_date AND
        end_date >= :start_date
      ) OR (
        start_date <= :end_date AND
        end_date >= :end_date
      )
    )", start_date, end_date, instrument_id
  end

  private

  def no_booking_overlap
    if Booking.overlapping(start_date, end_date, instrument_id).any?
      errors.add(:start_date, 'it overlaps another reservation')
      errors.add(:end_date, 'it overlaps another reservation')
    end
  end
end
