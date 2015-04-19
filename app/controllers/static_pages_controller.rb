class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @invitation = Invitation.new
    @room = Room.new
    @conversation = Conversation.new
  end
end
