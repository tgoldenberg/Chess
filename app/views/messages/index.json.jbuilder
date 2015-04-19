json.array!(@messages) do |message|
  json.extract! message, :id, :sender_id, :recipient_id, :conversation_id, :body
  json.url message_url(message, format: :json)
end
