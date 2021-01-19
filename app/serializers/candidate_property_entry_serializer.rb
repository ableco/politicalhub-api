class CandidatePropertyEntrySerializer < ActiveModel::Serializer
  attributes :property_type, :registry_type, :value, :address, :license_plate_or_public_record, :description
end
