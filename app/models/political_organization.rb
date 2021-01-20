class PoliticalOrganization < ApplicationRecord
  has_many :political_organization_stats

  before_save :set_slug

  def set_slug
    self.slug ||= name.parameterize
  end
end
