class AddStateToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :state, :string, default: :inscrito
  end
end
