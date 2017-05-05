class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :from
      t.string :destination
      t.datetime :timearr
      t.datetime :timedep
      t.string :via
      t.integer :seats

      t.timestamps
    end
  end
end
