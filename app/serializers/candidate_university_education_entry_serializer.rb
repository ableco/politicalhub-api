class CandidateUniversityEducationEntrySerializer < ActiveModel::Serializer
  attributes :university, :degree, :finished, :graduated, :degree_year
end
