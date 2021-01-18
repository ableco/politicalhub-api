class CreateCandidateWorkExperienceEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_work_experience_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :workplace
      t.string :profession
      t.integer :start_year
      t.integer :end_year, null: true
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
