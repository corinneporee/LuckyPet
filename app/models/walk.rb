class Walk < ApplicationRecord
  has_many :invitations, dependent: :destroy
  belongs_to :spot
  belongs_to :dog

  validates :date, presence: true
end
