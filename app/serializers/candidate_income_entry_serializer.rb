class CandidateIncomeEntrySerializer < ActiveModel::Serializer
  attributes :year, :income_type, :amount
end
