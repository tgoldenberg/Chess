class Room < ActiveRecord::Base
  belongs_to :invitation
  belongs_to :player1, class: User
  belongs_to :player2, class: User

  has_many :moves
end
