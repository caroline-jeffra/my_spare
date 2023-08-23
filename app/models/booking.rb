class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  validates :start_date, :end_date, :instrument, :user, presence: true
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date

  # calls no_booking_overlap method
  validate :no_booking_overlap

  # Runs Booking.where
  # Returns array of Bookings that would overlap with dates
  # If the array is empty there are no conflicts
  # If the array is not empty there are conflicts
  def self.overlapping(new_booking_start_date, new_booking_end_date, new_booking_instrument_id)
    where "
    instrument_id = :instrument_id AND (
      (
        start_date <= :start_date AND
        end_date >= :start_date
      ) OR (
        start_date <= :end_date AND
        end_date >= :end_date
      )
    )", start_date: new_booking_start_date, end_date: new_booking_end_date, instrument_id: new_booking_instrument_id
  end

  private

  def no_booking_overlap
    # Guard clause
    return true if Booking.overlapping(start_date, end_date, instrument_id).none?

    # else
    errors.add(:start_date, 'it overlaps another reservation')
    errors.add(:end_date, 'it overlaps another reservation')
    return false
  end
end
