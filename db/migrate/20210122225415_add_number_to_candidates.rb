class AddNumberToCandidates < ActiveRecord::Migration[6.1]
  def change
    add_column :candidates, :number, :integer
  end
end
