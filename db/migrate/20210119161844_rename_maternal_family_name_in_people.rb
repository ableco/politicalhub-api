class RenameMaternalFamilyNameInPeople < ActiveRecord::Migration[6.1]
  def change
    rename_column :people, :maternal_family_name, :mothers_maiden_name
  end
end
