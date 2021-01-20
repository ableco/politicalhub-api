class CreatePoliticalOrganizationStats < ActiveRecord::Migration[6.1]
  def change
    create_table :political_organization_stats do |t|
      t.references :political_organization, null: false, foreign_key: true
      t.references :electoral_process, null: false, foreign_key: true
      t.integer :total_candidates_with_sentences, default: 0
      t.integer :total_sentences, default: 0

      t.timestamps
    end
  end
end
