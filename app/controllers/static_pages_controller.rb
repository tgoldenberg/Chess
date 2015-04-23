class StaticPagesController < ApplicationController
  respond_to :html, :js

  def home
    @users = User.all
    @user = User.new
    @invitation = Invitation.new
    @room = Room.new
    @conversation = Conversation.new
  end


end
