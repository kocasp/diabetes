json.array!(@measurement_types) do |measurement_type|
  json.extract! measurement_type, :id, :name
  json.url measurement_type_url(measurement_type, format: :json)
end
