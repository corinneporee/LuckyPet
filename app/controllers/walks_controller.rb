class WalksController < ApplicationController

  def index
    @walks = current_user.dog.walks.order(date: :desc)
  end

  def show
    @walk = Walk.find(params[:id])
    @friends = current_user.dog.active_friends
    @invitation = Invitation.new
  end

  def new
    @walk = Walk.new
    @walk.invitations.build

    @friendships = current_user.dog.friendships
  end

  def create
    @spot = Spot.find(params[:spot_id])

    @walk = Walk.new(date: walk_params[:date])
    @walk.spot = @spot
    @walk.dog = current_user.dog

    invited_dog = Dog.find(walk_params[:invitations_attributes]["0".to_sym][:dog_id])
    @invit = Invitation.new(message: walk_params[:invitations_attributes]["0".to_sym][:message])
    @invit.walk = @walk
    @invit.dog = invited_dog


    if @walk.valid? && @invit.valid?
      @walk.save
      @invit.save
      redirect_to walks_path, notice: "Balade créée !"
    else
      render "spots/show", status: :unprocessable_entity
    end
  end


  private

  def walk_params
    params.require(:walk).permit(:date, invitations_attributes: [:dog_id, :message])
  end
end
