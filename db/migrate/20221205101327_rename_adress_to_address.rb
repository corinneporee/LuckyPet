class RenameAdressToAddress < ActiveRecord::Migration[7.0]
  def change
    rename_column :spots, :adress, :address
  end
end
