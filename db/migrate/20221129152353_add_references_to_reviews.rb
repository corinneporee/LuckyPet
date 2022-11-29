class AddReferencesToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :dog, foreign_key: true, index: true, null: false
    add_reference :reviews, :spot, foreign_key: true, index: true, null: false
  end
end
