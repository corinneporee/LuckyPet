class CreateWalks < ActiveRecord::Migration[7.0]
  def change
    create_table :walks do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
