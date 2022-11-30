class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :spot

  validates :content, length: { maximum: 100 }
end
