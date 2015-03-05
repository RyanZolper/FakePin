json.array!(@pins) do |pin|
  json.extract! pin, :id, :title, :description, :url, :pin_image
  json.url pin_url(pin, format: :json)
end
