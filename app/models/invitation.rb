class Invitation < ActiveRecord::Base
  belongs_to :sender, class: User
  belongs_to :recipient, class: User
  has_one :room 
end
