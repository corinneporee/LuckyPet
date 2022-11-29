class AddForeignKeyToSpot < ActiveRecord::Migration[7.0]
  def change
    remove_reference :spots, :user
    add_reference :spots, :user, foreign_key: true, index: true, null: false
  end
end
