json.array!(@moves) do |move|
  json.extract! move, :id, :notation, :room_id, :piece
  json.url move_url(move, format: :json)
end
