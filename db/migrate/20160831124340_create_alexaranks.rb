class CreateAlexaranks < ActiveRecord::Migration[5.0]
  def change
    create_table :alexaranks do |t|
      t.integer :rank
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
