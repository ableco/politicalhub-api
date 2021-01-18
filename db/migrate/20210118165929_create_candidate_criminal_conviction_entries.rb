class CreateCandidateCriminalConvictionEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_criminal_conviction_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :record_id
      t.date :date
      t.string :court
      t.string :crime
      t.string :sentence
      t.string :sentence_type
      t.string :status
      t.integer :jne_id

      t.timestamps
    end
  end
end
