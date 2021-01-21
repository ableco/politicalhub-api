module IndividualFinancialContributionTotalsCounter
  extend ActiveSupport::Concern

  included do
    after_save :update_total_individual_financial_contributions
  end

  def update_total_individual_financial_contributions
    total_individual_financial_contributions = person.individual_financial_contributions.sum(:amount_total)

    person.update(total_individual_financial_contributions: total_individual_financial_contributions)
  end
end
