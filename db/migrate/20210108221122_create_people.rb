class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :identification_number
      t.string :family_name
      t.string :maternal_family_name
      t.string :names
      t.date :date_of_birth
      t.string :country_of_birth
      t.string :profile_photo

      t.timestamps
    end
  end
end
