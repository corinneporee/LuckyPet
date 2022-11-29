class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :walk, null: false, foreign_key: true
      t.string :message
      t.string :status

      t.timestamps
    end
  end
end
