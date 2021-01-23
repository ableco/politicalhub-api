class PersonSerializer < ActiveModel::Serializer
  attributes :country_of_birth, :total_individual_financial_contributions, :total_tax_debts

  has_many :individual_financial_contributions
  has_many :electoral_history_entries
  has_many :tax_debts
end
