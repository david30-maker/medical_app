class AddAgeToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :age, :integer
  end
end
