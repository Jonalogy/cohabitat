json.extract! booking, :id, :space_id, :availability_id, :start, :end, :seat, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)