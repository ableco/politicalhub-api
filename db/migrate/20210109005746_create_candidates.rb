class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.references :person, null: false, foreign_key: true
      t.references :electoral_process, null: false, foreign_key: true
      t.references :political_organization, null: false, foreign_key: true
      t.string :residence_ubigeo
      t.string :residence_region
      t.string :residence_province
      t.string :residence_district
      t.string :postulation_ubigeo
      t.integer :office_id, null: false
      t.integer :secondary_office_id, null: true
      t.integer :jne_id, null: false
      t.decimal :total_properties_value, precision: 12, scale: 2

      t.timestamps
    end
  end
end
