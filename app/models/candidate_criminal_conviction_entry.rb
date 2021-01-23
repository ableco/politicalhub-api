class CandidateCriminalConvictionEntry < ApplicationRecord
  include PoliticalOrganizationTotalSentencesCounter

  belongs_to :candidate
end
