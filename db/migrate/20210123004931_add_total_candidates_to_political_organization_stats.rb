class AddTotalCandidatesToPoliticalOrganizationStats < ActiveRecord::Migration[6.1]
  def change
    add_column :political_organization_stats, :total_candidates, :integer, default: 0
  end
end
