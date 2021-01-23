class CandidateCivilJudgementEntry < ApplicationRecord
  include PoliticalOrganizationTotalSentencesCounter

  belongs_to :candidate
end
