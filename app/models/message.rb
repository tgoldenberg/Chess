class Message < ActiveRecord::Base
  validates :conversation_id, presence: true
  validates :body, presence: true
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  
  belongs_to :conversation
  belongs_to :sender, class: User
  belongs_to :recipient, class: User
end
