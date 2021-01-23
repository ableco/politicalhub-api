class TaxDebtSerializer < ActiveModel::Serializer
  attributes :period, :amount
end
