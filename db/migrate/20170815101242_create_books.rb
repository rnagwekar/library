class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :team
      t.string :category
      t.string :title
      t.string :auther
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
