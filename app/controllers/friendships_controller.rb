class FriendshipsController < ApplicationController
  def index
    @friends = current_user.dog.friends

    if params[:query].present?
      sql_query = "name ILIKE :query"
      @dogs = Dog.where(sql_query, query: "%#{params[:query]}%").where.not(id: current_user.dog.id)
    end
  end

  def create
    @buddy = Dog.find(params[:dog_id])
    @dog = current_user.dog

    @friendship = Friendship.new(buddy: @buddy, dog: @dog)

    if @friendship.save
      redirect_to friendships_path, notice: "Demande envoyée"
    else
      redirect_to friendships_path, alert: "Une erreur est survenue"
    end
  end


end
