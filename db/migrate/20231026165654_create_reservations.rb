class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :date_and_time
      t.references :user, null: false, foreign_key: true
      t.references :parachute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
