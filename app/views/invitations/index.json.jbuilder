json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :sender_id, :recipient_id
  json.url invitation_url(invitation, format: :json)
end
