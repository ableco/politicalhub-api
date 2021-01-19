class ChangeValueInCandidatePropertyEntries < ActiveRecord::Migration[6.1]
  def change
    change_column :candidate_property_entries, :value, :decimal, precision: 12, scale: 2
  end
end
