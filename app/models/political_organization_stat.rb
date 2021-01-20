class PoliticalOrganizationStat < ApplicationRecord
  belongs_to :political_organization
  belongs_to :electoral_process
end
