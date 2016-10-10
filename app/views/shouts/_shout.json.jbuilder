json.extract! shout, :id, :user_id, :space_id, :message, :created_at, :updated_at
json.url shout_url(shout, format: :json)