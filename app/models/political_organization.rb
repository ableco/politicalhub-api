class PoliticalOrganization < ApplicationRecord
  has_one :political_organization_stat, -> { joins(:electoral_process).where(electoral_processes: { jne_id: ElectoralProcess::LAST_ELECTION_ID }) }

  before_save :set_slug

  def set_slug
    self.slug ||= name.parameterize
  end
end
