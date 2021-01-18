class CandidatePropertyEntrySerializer < ActiveModel::Serializer
  attributes :property_type, :registry_type, :value, :address, :description
end
