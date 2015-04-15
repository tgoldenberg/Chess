json.array!(@rooms) do |room|
  json.extract! room, :id, :player1_id, :player2_id, :invitation_id
  json.url room_url(room, format: :json)
end
