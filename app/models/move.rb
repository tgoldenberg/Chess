class Move < ActiveRecord::Base
  validates :room_id, presence: true
  validates :piece, presence: true
  validates :notation, presence: true
  validates :user_id, presence: true

  belongs_to :room
  belongs_to :user
end
