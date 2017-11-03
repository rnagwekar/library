class ChangeIntegerLimitInPeople < ActiveRecord::Migration[5.0]
  def change
  	change_column :people, :phone, :integer, limit: 8
  end
end
