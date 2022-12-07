class Friendship < ApplicationRecord
  belongs_to :dog
  belongs_to :buddy, class_name: "Dog"

  validates :status, presence: true

  def accept!
    self.status = "accepted"
    self.save
  end

  def refuse!
    self.status = "refused"
    self.save
  end
end
