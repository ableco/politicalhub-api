module TaxDebtTotalsCounter
  extend ActiveSupport::Concern

  included do
    after_save :update_total_tax_debts
  end

  def update_total_tax_debts
    total_tax_debts = person.tax_debts.sum(:amount)

    person.update(total_tax_debts: total_tax_debts)
  end
end
