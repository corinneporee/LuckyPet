class Dog < ApplicationRecord
  PERSONALITY = ["Sympa avec tout le monde", "Carrément timide", "J'ai mes têtes", "Faut pas me chercher", "Fou-fou"]

  BREEDS = ["Croisé", "Teckel", "Golden Retriever", "Berger Australien", "Border Terrier",
            "Husky de Sibérie", "Cavalier King Charles", "Welsh Corgi", "Cocker Spaniel", "American Staffordshire Terrier", "Chihuahua", "Berger Allemand"]

  HEALTH = ["Je pète la forme", "Raplapla", "Sous traitement"]
  SEX = ["Female", "Male"]

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

  validates :personality, inclusion: { in: PERSONALITY }
  validates :breed, inclusion: { in: BREEDS }
  validates :health, inclusion: { in: HEALTH }
  validates :neutered, inclusion: { in: [true, false] }

  belongs_to :user
  has_many :friendships, dependent: :destroy
  has_many :walks, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, :breed, :weight, :personality, :gender, :health, presence: true

  def friends
    own_friendships = Friendship.where(dog_id: id).pluck(:buddy_id)
    other_friendships = Friendship.where(buddy_id: id).pluck(:dog_id)

    ids = own_friendships + other_friendships

    Dog.where(id: ids)
  end

  def active_friends
    own_friendships = Friendship.where(status: "accepted", dog_id: id).pluck(:buddy_id)
    other_friendships = Friendship.where(status: "accepted", buddy_id: id).pluck(:dog_id)

    ids = own_friendships + other_friendships

    Dog.where(id: ids)
  end

  def friendship_status_with(dog)
    friendship = Friendship.find_by(buddy: dog, dog: self) || Friendship.find_by(dog: dog, buddy: self)
    friendship.status
  end

  def friend_with?(dog)
    friends.include?(dog)
  end

  def invitations_and_walks
    invitations_and_walks = self.invitations + self.walks
    return invitations_and_walks.sort! { |a, b| a.created_at <=> b.created_at }
  end
end

# if friend_with?(dog)
#   "Vous êtes déjà amis"
# else
#   link_to "Inviter"
# end
