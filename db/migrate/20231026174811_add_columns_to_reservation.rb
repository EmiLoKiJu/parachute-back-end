class AddColumnsToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :duration, :integer
  end
end
