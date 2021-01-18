class CreateCandidatePoliticalPartyOfficeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_political_party_office_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.integer :political_organization_id
      t.string :political_organization_name
      t.string :office
      t.integer :start_year
      t.integer :end_year
      t.text :comments
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
