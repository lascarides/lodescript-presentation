json.array!(@pieces) do |piece|
  json.extract! piece, :organization, :predicate, :thing, :content, :equivalent
  json.url piece_url(piece, format: :json)
end
