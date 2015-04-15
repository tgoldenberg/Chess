class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def show
  end

  def new
    @invitation = Invitation.new
    @invitation.sender_id = params[:sender_id]
    @invitation.recipient_id = params[:recipient_id]
    if @invitation.save
      redirect_to root_path
    end

  end

  def create
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: 'Invitation was successfully created.' }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:sender_id, :recipient_id)
    end
end
