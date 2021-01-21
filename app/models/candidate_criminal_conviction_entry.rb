class CandidateCriminalConvictionEntry < ApplicationRecord
  include PoliticalOrganizationStatsCounter

  belongs_to :candidate
end
