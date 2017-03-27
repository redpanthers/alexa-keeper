class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :websites, [:url, :user_id,]
  end
end
