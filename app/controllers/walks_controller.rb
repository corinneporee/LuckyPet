class WalksController < ApplicationController
  def show
    @walk = Walk.find(params[:id])
    @friends = current_user.dog.active_friends
    @invitation = Invitation.new
  end

  def create
    @spot = Spot.find(params[:spot_id])

    @walk = Walk.new(walk_params)
    @walk.spot = @spot
    @walk.dog = current_user.dog

    if @walk.save
      redirect_to walk_path(@walk), notice: "Balade créée !"
    else
      render "spots/show", status: :unprocessable_entity
    end
  end

  private

  def walk_params
    params.require(:walk).permit(:date)
  end
end
