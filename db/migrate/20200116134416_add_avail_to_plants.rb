class AddAvailToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :avail_from, :date
  end
end
