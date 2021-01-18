class CreateCandidatePropertyEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_property_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.string :property_type
      t.string :registry_type
      t.decimal :value, precision: 10, scale: 2
      t.string :license_plate_or_public_record
      t.string :address
      t.string :description
      t.text :comments
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
