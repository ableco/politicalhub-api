class CreateIndividualFinancialContributions < ActiveRecord::Migration[6.1]
  def change
    create_table :individual_financial_contributions do |t|
      t.references :person, null: false, foreign_key: true
      t.string :period
      t.decimal :amount_money, precision: 12, scale: 2, default: 0.0
      t.decimal :amount_others, precision: 12, scale: 2, default: 0.0
      t.decimal :amount_total, precision: 12, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
