class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @walk = Walk.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user

    if @spot.save
      redirect_to spot_path(@spot), notice: "Spot créé !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(
      :spot_type,
      :name,
      :adress,
      :description,
      :walk_environment,
      :walk_area,
      :walk_attendance,
      :vet_specialty,
      :shop_cereale,
      :shop_vrac,
      :shop_insects,
      :pension_pro,
      :pension_walks,
      :grooming_shop,
      :photo
    )
  end
end
