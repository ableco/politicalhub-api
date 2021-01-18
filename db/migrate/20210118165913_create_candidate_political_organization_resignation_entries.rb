class CreateCandidatePoliticalOrganizationResignationEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_political_organization_resignation_entries do |t|
      t.references :candidate, null: false, foreign_key: true, index: { name: "index_political_organization_resignations_on_candidate_id" }
      t.integer :political_organization_id
      t.string :political_organization_name
      t.integer :resignation_year
      t.text :comments
      t.integer :jne_id

      t.timestamps
    end
  end
end
