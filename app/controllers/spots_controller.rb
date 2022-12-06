class SpotsController < ApplicationController
  def index
    if params[:spots_type].blank?
      @spots = Spot.all
    else
      @spots = Spot.where(spot_type: params[:spots_type].capitalize)
    end

    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
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
      :address,
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
