class Friendship < ApplicationRecord
  belongs_to :dog
  belongs_to :buddy, class_name: "Dog"
end
