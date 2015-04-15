class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @invitation = Invitation.new
    @room = Room.new
  end
end
