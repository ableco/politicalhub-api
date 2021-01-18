class CreateCandidateCivilJudgementEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_civil_judgement_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :judgement_type
      t.string :record_id
      t.string :court
      t.string :sentence
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
