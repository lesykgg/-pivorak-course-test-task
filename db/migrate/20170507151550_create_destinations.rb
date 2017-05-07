class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :point
      t.datetime :timearr
      t.references :trip, foreign_key: true

      t.timestamps
    end
    remove_column :trips, :destination
    remove_column :trips, :timearr
    remove_column :trips, :via
    remove_column :trips, :from
  end
end
