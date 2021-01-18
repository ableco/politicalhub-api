class CreateCandidateGraduateEducationEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_graduate_education_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :grad_school
      t.string :major
      t.boolean :finished
      t.boolean :graduated
      t.integer :degree_year
      t.boolean :master_degree
      t.boolean :phd
      t.text :comments
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
