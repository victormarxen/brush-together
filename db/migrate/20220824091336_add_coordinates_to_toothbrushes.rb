class AddCoordinatesToToothbrushes < ActiveRecord::Migration[7.0]
  def change
    add_column :toothbrushes, :latitude, :float
    add_column :toothbrushes, :longitude, :float
  end
end
