class FeedsController < ApplicationController
  def index
    buddies_id = current_user.dog.friendships.map(&:buddy_id)
    @posts = Post.where(dog_id: buddies_id)
  end
end
