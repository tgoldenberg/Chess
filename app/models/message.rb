class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, class: User
  belongs_to :recipient, class: User
end
