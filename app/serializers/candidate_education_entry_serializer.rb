class CandidateEducationEntrySerializer < ActiveModel::Serializer
  attributes :education_type, :center, :career, :finished
end
