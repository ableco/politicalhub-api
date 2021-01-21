class CandidateCivilJudgementEntry < ApplicationRecord
  include PoliticalOrganizationStatsCounter

  belongs_to :candidate
end
