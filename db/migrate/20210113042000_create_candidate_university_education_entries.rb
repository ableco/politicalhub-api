class CreateCandidateUniversityEducationEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_university_education_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :university
      t.string :degree
      t.boolean :finished
      t.boolean :graduated
      t.integer :degree_year
      t.text :comments
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
