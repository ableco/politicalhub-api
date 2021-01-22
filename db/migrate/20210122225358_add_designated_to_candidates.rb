class AddDesignatedToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :designated, :boolean
  end
end
