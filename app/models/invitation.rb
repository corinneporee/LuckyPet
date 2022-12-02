class Invitation < ApplicationRecord
  belongs_to :dog
  belongs_to :walk

  validates :message, :status, presence: true

end
