json.array!(@equivalents) do |equivalent|
  json.extract! equivalent, :name, :url, :organization, :namespace
  json.url equivalent_url(equivalent, format: :json)
end
