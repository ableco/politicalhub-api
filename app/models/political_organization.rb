class PoliticalOrganization < ApplicationRecord
  before_save :set_slug

  def set_slug
    self.slug ||= name.parameterize
  end
end
