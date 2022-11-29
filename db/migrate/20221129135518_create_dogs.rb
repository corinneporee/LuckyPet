class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.float :weight
      t.date :date_of_birth
      t.string :personality
      t.string :gender
      t.string :health
      t.boolean :neutered
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
