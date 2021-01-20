class PoliticalOrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :logo

  has_one :political_organization_stat
end
