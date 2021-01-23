class CandidateEducationEntrySerializer < ActiveModel::Serializer
  attributes :education_type, :finished
  attribute :career, if: :has_career_or_center?
  attribute :center, if: :has_career_or_center?

  def has_career_or_center?
    ["technical_studies", "training"].include?(object.education_type)
  end
end
