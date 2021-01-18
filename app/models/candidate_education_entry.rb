class CandidateEducationEntry < ApplicationRecord
  TYPES = %w[primary secondary technical_studies training]

  belongs_to :candidate
end
