class PoliticalOrganizationStatSerializer < ActiveModel::Serializer
  attributes :total_candidates, :total_designated, :total_m, :total_f, :total_candidates_with_sentences, :total_sentences
end
