class Destination < ApplicationRecord
  belongs_to :trip
  validates :point, presence: true

  def station_arrival_time
    timearr.strftime("%H:%M UTC")
  end
  
end
