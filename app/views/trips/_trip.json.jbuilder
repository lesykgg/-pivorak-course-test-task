json.extract! trip, :id, :from, :destination, :timedep, :timearr, :via, :seats, :created_at, :updated_at
json.url trip_url(trip, format: :json)
