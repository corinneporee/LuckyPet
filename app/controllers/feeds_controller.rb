class FeedsController < ApplicationController
  def index
    buddies_id = current_user.dog.friendships.map(&:buddy_id)
    @posts = Post.where(dog_id: buddies_id)
    @friendships = Friendship.where(buddy_id: current_user.dog.id).where(status: "pending")
    @invitations = Invitation.where(dog_id: current_user.dog.id).where(status: "pending")
  end

  def accept_friend
    fs = Friendship.find(params[:friendship_id])
    fs.accept!
    redirect_to "/feeds", notice: "Vous êtes desormais amis avec #{fs.dog.name}"
  end

  def refuse_friend
    fs = Friendship.find(params[:friendship_id])
    fs.refuse!
    redirect_to "/feeds", notice: "Vous avez refusé l'invitation de la part de #{fs.dog.name}"
  end
end
