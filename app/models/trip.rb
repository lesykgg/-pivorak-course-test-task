class Trip < ApplicationRecord
  has_many :destinations, inverse_of: :trip
  accepts_nested_attributes_for :destinations, reject_if: :all_blank, allow_destroy: true
  has_many :tickets, dependent: :destroy
  has_many :bookings, dependent: :destroy

  def self.search(search, search2, search3)
    joins(:destinations).where(destinations: { point: search }, destinations: { point: search2 }, destinations: { datearr: search3})
  end

  def route_points
  	points = destinations.order(:datearr || :timearr).map(&:point)
    unless points.length <= 2
    points[1..-2].join(', ')
    end
  end

  def departure_point
    destinations.order(:datearr,  :timearr).first&.point
  end

  def ride_destination
  	destinations.order(:datearr, :timearr).last&.point
  end

  def ride_arrival_time
    d = destinations.order(:datearr, :timearr).last&.datearr
    t = destinations.order(:datearr, :timearr).last&.timearr
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, "00:00")
  end
end
