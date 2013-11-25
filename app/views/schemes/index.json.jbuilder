json.array!(@schemes) do |scheme|
  json.extract! scheme, :name, :url
  json.url scheme_url(scheme, format: :json)
end
