class Ticket < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :seatnum, :name, :trip_id, :from, :to, presence: true
end
