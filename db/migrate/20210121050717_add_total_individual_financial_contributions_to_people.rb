class AddTotalIndividualFinancialContributionsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :total_individual_financial_contributions, :decimal, precision: 12, scale: 2, default: 0.0
  end
end
