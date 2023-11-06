class AddColumnsToParachute2 < ActiveRecord::Migration[7.0]
  def change
    add_column :parachutes, :photo_link, :text
  end
end
