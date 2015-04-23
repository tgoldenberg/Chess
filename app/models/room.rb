class Room < ActiveRecord::Base
  validates :player1_id, presence: true
  validates :player2_id, presence: true
  validates :invitation_id, presence: true 

  belongs_to :invitation
  belongs_to :player1, class: User
  belongs_to :player2, class: User

  has_many :moves, dependent: :destroy


end
