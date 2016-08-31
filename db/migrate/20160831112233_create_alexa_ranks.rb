class CreateAlexaRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :alexa_ranks do |t|
      t.integer :rank
      t.references :websites, foreign_key: true

      t.timestamps
    end
  end
end
