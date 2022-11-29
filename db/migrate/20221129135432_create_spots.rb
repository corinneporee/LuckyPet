class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.string :adress
      t.string :spot_type
      t.string :vet_specialty
      t.string :walk_environment
      t.string :walk_area
      t.string :walk_attendance
      t.boolean :shop_cereale
      t.boolean :shop_vrac
      t.boolean :shop_insects
      t.boolean :pension_pro
      t.boolean :pension_walks
      t.boolean :grooming_shop
      t.references :user

      t.timestamps
    end
  end
end
