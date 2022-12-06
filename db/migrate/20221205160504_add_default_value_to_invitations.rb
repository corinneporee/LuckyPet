class AddDefaultValueToInvitations < ActiveRecord::Migration[7.0]
  def change
    change_column :invitations, :status, :string, default: "pending"
  end
end
