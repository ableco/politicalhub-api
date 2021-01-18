class CandidatePropertyEntry < ApplicationRecord
  TYPES = %w[real_state vehicle]

  belongs_to :candidate
  after_save :update_total_properties_value

  def update_total_properties_value
    candidate.total_properties_value = candidate.candidate_property_entries.sum(:value)
    candidate.save
  end
end
