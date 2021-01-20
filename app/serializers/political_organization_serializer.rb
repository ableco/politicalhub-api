class PoliticalOrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :logo

  has_many :political_organization_stats
end
