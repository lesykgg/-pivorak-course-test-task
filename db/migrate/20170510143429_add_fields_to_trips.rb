class AddFieldsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :freeseats, :integer
  end
end
