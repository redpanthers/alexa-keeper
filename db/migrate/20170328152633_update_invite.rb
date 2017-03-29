class UpdateInvite < ActiveRecord::Migration[5.0]
  def change
    rename_column :invites, :accept, :approved
    add_column :invites, :accepted, :boolean, default: false
  end
end
