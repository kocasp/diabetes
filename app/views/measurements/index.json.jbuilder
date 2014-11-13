json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :type_id, :user_id, :datetime, :value
  json.url measurement_url(measurement, format: :json)
end
