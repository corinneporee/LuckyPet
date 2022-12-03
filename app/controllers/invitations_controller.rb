class InvitationsController < ApplicationController
  def accept
  end

  def create
    @walk = Walk.find(params[:walk_id])

    @invitation = Invitation.new(invitation_params)
    @invitation.status = "pending"
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
