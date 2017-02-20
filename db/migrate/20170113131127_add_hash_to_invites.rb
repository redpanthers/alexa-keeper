class AddHashToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :hash, :string
  end
end
