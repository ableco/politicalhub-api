class IndividualFinancialContribution < ApplicationRecord
  include IndividualFinancialContributionTotalsCounter

  belongs_to :person
end
