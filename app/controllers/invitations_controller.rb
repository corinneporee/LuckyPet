class InvitationsController < ApplicationController
  def accept
    @invitation = Invitation.find(params[:id])
    @invitation.status = "Acceptée"
    @invitation.save

    redirect_to walk_path(@invitation.walk)
  end

  def create
    @walk = Walk.find(params[:walk_id])

    @invitation = Invitation.new(invitation_params)
    @invitation.status = "En attente"
    @invitation.walk = @walk

    if @invitation.save
      redirect_to walk_path(@walk), notice: "Invitation envoyée !"
    else
      render "walks/show", status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:dog_id, :message)
  end
end
