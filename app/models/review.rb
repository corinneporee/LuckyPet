class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :spot
  has_one_attached :photo

  validates :content, length: { maximum: 100 }
end
