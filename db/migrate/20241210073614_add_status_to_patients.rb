class AddStatusToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :status, :integer
  end
end
