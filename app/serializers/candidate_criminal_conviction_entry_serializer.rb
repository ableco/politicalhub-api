class CandidateCriminalConvictionEntrySerializer < ActiveModel::Serializer
  attributes :record_id, :date, :court, :crime, :sentence, :sentence_type, :status
end
