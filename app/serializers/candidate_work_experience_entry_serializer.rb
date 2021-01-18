class CandidateWorkExperienceEntrySerializer < ActiveModel::Serializer
  attributes :workplace, :profession, :start_year, :end_year
end
