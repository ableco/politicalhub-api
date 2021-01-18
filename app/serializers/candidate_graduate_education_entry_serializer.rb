class CandidateGraduateEducationEntrySerializer < ActiveModel::Serializer
  attributes :grad_school, :major, :finished, :graduated, :degree_year, :master_degree, :phd
end
