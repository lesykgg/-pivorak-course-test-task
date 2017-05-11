class Destination < ApplicationRecord
  belongs_to :trip
  validates :point, :timearr, :datearr, presence: true

  def station_arrival_time
    timearr.strftime("%H:%M UTC")
  end
  
end
