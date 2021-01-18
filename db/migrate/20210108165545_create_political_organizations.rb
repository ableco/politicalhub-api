class CreatePoliticalOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :political_organizations do |t|
      t.string :name
      t.string :slug
      t.string :logo
      t.date :enrolled_at
      t.string :website
      t.string :organization_type
      t.integer :jne_id

      t.timestamps
    end
  end
end
