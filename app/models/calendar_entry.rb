class CalendarEntry < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :end_time, :presence => true
  validates :start_time, :presence => true
end
