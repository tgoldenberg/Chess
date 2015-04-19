class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitations, as: :sender, class: User
  has_many :invitations, as: :recipient, class: User
  has_many :rooms, through: :invitations

  has_many :messages, as: :sender, class: User
  has_many :messages, as: :recipient, class: User
end
