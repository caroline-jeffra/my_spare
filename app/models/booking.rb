class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  validates :start_date, :end_date, :instrument, :user, presence: true
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date
end
