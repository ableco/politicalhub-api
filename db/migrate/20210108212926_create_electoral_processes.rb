class CreateElectoralProcesses < ActiveRecord::Migration[6.1]
  def change
    create_table :electoral_processes do |t|
      t.string :name
      t.string :slug
      t.date :started_at, null: true
      t.integer :jne_id

      t.timestamps
    end
  end
end
