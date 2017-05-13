class Ticket < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :seatnum, :name, :trip_id, :from, :to, presence: true

  def date_departure
    Destination.find_by(point: self.from).datearr
  end

  def time_departure
    Destination.find_by(point: self.from).timearr.strftime('%H:%M')
  end

  def date_arrival
    Destination.find_by(point: self.to).datearr
  end

  def time_arrival
    Destination.find_by(point: self.to).timearr.strftime('%H:%M')
  end
end
