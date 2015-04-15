class Move < ActiveRecord::Base
  belongs_to :room
  belongs_to :player1, class: User, through: :room
  belongs_to :player2, class: User, through: :room
end
