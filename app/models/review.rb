class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :spot

  validate :review, length: { maximum: 100 }
end
