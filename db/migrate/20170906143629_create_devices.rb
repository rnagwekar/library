class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :device_id
      t.string :company
      t.string :name
      t.string :lent_by
      t.string :team
      t.string :location
      t.string :category
      t.string :info
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
