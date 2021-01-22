class Person < ApplicationRecord
  has_many :individual_financial_contributions
  has_many :tax_debts
end
