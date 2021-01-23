class AddTotalCandidatesByGenderToPoliticalOrganizationStats < ActiveRecord::Migration[6.1]
  def change
    add_column :political_organization_stats, :total_m, :integer, default: 0
    add_column :political_organization_stats, :total_f, :integer, default: 0
  end
end
