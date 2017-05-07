class Trip < ApplicationRecord
  has_many :destinations, dependent: :destroy

  def self.search(search, search2)
    
    joins(:destinations).where(destinations: { point: search }, destinations: { point: search2 })
  end

  def route_points
  	points = destinations.order(:timearr).map(&:point)
    unless points.length <= 2
    points[1..-2].join(', ')
    end
  end

  def departure_point
    destinations.order(:timearr).first&.point
  end

  def ride_destination
  	destinations.order(:timearr).last&.point
  end

  def ride_arrival_time
  	destinations.order(:timearr).last&.timearr
  end
end
