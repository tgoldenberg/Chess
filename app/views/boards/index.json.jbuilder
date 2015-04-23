json.array!(@boards) do |board|
  json.extract! board, :id, :fen, :move_id
  json.url board_url(board, format: :json)
end
