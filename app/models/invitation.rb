class Invitation < ActiveRecord::Base
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
  
  belongs_to :sender, class: User
  belongs_to :recipient, class: User
  has_one :room
end
