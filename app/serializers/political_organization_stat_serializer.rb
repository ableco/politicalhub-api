class PoliticalOrganizationStatSerializer < ActiveModel::Serializer
  attributes :total_candidates_with_sentences, :total_sentences
end