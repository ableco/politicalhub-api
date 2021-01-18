class CreateCandidateEducationEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_education_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :education_type
      t.string :center
      t.string :career
      t.boolean :finished
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
