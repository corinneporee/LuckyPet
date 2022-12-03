class Invitation < ApplicationRecord
  belongs_to :dog
  belongs_to :walk

  validates :message, presence: true
end
