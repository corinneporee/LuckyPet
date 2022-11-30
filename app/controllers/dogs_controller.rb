class DogsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.save

    redirect_to dog_path(@dog)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :weight, :date_of_birth, :personality, :gender, :health, :neutered)
  end

end
