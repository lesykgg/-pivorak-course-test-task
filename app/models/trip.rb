class Trip < ApplicationRecord
  has_many :destinations, inverse_of: :trip, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_one :first_destination, class_name: 'Destination'
  has_one :second_destination, class_name: 'Destination'

  accepts_nested_attributes_for :destinations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tickets, reject_if: :all_blank, allow_destroy: true

  validates :seats, :timedep, presence: true

  def self.search(search, search2, search3)
    # joins(:destinations).where('point = ? and point = ? and datearr = ?', "#{search}", "#{search2}", "#{search3}")
    joins(:first_destination, :second_destination)
      .where('(destinations.point ILIKE ? AND second_destinations_trips.point ILIKE ? ) AND destinations.datearr = ?', "%#{search}%", "%#{search2}%", "#{search3}")
  end

  def route_points
    points = destinations.order(:datearr || :timearr).map(&:point)
    unless points.length <= 2
      points[1..-2].join(', ')
    end
  end


  def departure_point
    destinations.order(:datearr, :timearr).first&.point
  end

  def ride_destination
    destinations.order(:datearr, :timearr).last&.point
  end

  def ride_arrival_time
    d = destinations.order(:datearr, :timearr).last&.datearr
    t = destinations.order(:datearr, :timearr).last&.timearr
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    dt.strftime('%H:%M %Y-%m-%d')
  end

  def start_point_departure
    d = destinations.order(:datearr, :timearr).first&.datearr
    t = destinations.order(:datearr, :timearr).first&.timearr
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
    dt.strftime('%H:%M %Y-%m-%d')
  end
end
