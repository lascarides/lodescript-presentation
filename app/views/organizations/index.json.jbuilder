json.array!(@organizations) do |organization|
  json.extract! organization, :name, :url
  json.url organization_url(organization, format: :json)
end
