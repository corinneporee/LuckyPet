class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.string :status, default: "pending"
      t.references :dog, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: { to_table: :dogs }

      t.timestamps
    end
  end
end
