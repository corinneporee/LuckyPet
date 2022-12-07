class Invitation < ApplicationRecord
  belongs_to :dog
  belongs_to :walk

  validates :message, presence: true

  def accept_inv!
    self.status = "accepted"
    self.save
  end
end
