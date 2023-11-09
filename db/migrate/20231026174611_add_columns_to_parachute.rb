class AddColumnsToParachute < ActiveRecord::Migration[7.0]
  def change
    add_column :parachutes, :rent, :decimal
    add_column :parachutes, :description, :text
    add_column :parachutes, :min_duration, :integer
  end
end
