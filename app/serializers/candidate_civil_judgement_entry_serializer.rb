class CandidateCivilJudgementEntrySerializer < ActiveModel::Serializer
  attributes :judgement_type, :record_id, :court, :sentence
end
