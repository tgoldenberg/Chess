class Board < ActiveRecord::Base
  validates :move_id, presence: true
  validates :fen, presence: true

  belongs_to :move
end
