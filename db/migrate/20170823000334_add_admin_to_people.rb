class AddAdminToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :admin, :boolean
  end
end
