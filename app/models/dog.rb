class Dog < ApplicationRecord
  belongs_to :user
  has_many :friendships

  def friends
    own_friendships = Friendship.where(status: "accepted", dog_id: id).pluck(:buddy_id)
    other_friendships = Friendship.where(status: "accepted", buddy_id: id).pluck(:dog_id)

    ids = own_friendships + other_friendships

    Dog.where(id: ids)
  end

  def friend_with?(dog)
    friends.include?(dog)
  end
end

# if friend_with?(dog)
#   "Vous êtes déjà amis"
# else
#   link_to "Inviter"
# end
