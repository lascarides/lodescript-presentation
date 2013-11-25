json.array!(@things) do |thing|
  json.extract! thing, :name, :lode, :scheme
  json.url thing_url(thing, format: :json)
end
