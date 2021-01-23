class IndividualFinancialContributionSerializer < ActiveModel::Serializer
  attributes :period, :amount_money, :amount_others, :amount_total
end
