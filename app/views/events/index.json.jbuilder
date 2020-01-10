json.array!(@events) do |event|
  json.extract! event, :id, :event_name, :dept, :reg_fees
  json.url event_url(event, format: :json)
end
