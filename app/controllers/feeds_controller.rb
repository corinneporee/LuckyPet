class FeedsController < ApplicationController
  def index
    @dog = current_user.dog
    # buddies_id = current_user.dog.friendships.map(&:buddy_id)
    @posts = current_user.dog.active_friends.map(&:posts).flatten
    @friendships = Friendship.where(buddy_id: current_user.dog.id).where(status: "pending")
    @my_friends = Friendship.where(buddy_id: current_user.dog.id).where(status: "accepted")
    @invitations = Invitation.where(dog_id: current_user.dog.id).where(status: "pending")
    @spots = Spot.last(3)
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

  def accept_invit
    invit = Invitation.find(params[:invitation_id])
    invit.accept_inv!
    redirect_to "/feeds", notice: "Vous avez accepté la balade de #{invit.walk.dog.name}"
  end
end
