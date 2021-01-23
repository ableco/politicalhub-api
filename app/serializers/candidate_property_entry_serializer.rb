class CandidatePropertyEntrySerializer < ActiveModel::Serializer
  attributes :property_type, :registry_type, :value, :description
  attribute :license_plate, if: :is_vehicle?
  attribute :public_record_id, if: :is_real_estate?
  # attribute :address, if: :is_real_estate?

  def is_real_estate?
    object.property_type == "real_estate"
  end

  def is_vehicle?
    object.property_type == "vehicle"
  end
end
