class CreateTaxDebts < ActiveRecord::Migration[6.1]
  def change
    create_table :tax_debts do |t|
      t.references :person, null: false, foreign_key: true
      t.string :period
      t.decimal :amount, precision: 12, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
