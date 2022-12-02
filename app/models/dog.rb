class Dog < ApplicationRecord
  PERSONALITY = ["Sympa avec tout le monde", "Carrément timide", "J'ai mes têtes", "Faut pas me chercher", "Fou-fou"]
  BREEDS = ["Chihuahua", "Teckel", "Golden Retriever", "Berger Australien", "Croisé"]
  HEALTH = ["Je pète la forme", "Raplapla", "Sous traitement"]
  SEX = ["Female", "Male"]

  validates :personality, inclusion: { in: PERSONALITY }
  validates :breed, inclusion: { in: BREEDS }
  validates :health, inclusion: { in: HEALTH }

  belongs_to :user
  has_many :friendships, dependent: :destroy
  has_many :walks, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, :breed, :weight, :personality, :gender, :health, :neutered, presence: true

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
