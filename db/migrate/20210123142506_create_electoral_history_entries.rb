class CreateElectoralHistoryEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :electoral_history_entries do |t|
      t.references :person, null: false, foreign_key: true
      t.references :electoral_process, null: false, foreign_key: true
      t.integer :political_organization_id
      t.string :political_organization_name
      t.integer :office_id
      t.string :office
      t.boolean :elected

      t.timestamps
    end
  end
end
