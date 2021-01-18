class CreateCandidateIncomeEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :candidate_income_entries do |t|
      t.references :candidate, null: false, foreign_key: true
      t.integer :year, null: false
      t.string :income_type, null: false
      t.decimal :amount, precision: 10, scale: 2
      t.integer :jne_id, null: false

      t.timestamps
    end
  end
end
