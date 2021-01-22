class TaxDebt < ApplicationRecord
  include TaxDebtTotalsCounter

  belongs_to :person
end
