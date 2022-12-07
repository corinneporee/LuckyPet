class Post < ApplicationRecord
  belongs_to :dog
  has_one_attached :photo
end
