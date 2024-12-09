class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.datetime :registered_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
