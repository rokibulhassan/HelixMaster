class AddGpsCoordinatesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :gps_coordinates, :string
  end
end
