class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :empid
      t.string :name
      t.string :lastname
      t.integer :phone
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
