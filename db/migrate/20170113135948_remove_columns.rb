class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :invites, :hash
    

  end
end
