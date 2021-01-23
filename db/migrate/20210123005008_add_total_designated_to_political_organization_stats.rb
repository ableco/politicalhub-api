class AddTotalDesignatedToPoliticalOrganizationStats < ActiveRecord::Migration[6.1]
  def change
    add_column :political_organization_stats, :total_designated, :integer, default: 0
  end
end
