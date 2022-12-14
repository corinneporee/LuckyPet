class DogsController < ApplicationController

  def index
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    @dog.neutered = @dog.neutered || false
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :weight, :date_of_birth, :personality, :gender, :health, :neutered, :photo)
  end

end
