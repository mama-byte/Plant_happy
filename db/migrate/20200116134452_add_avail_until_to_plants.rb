class AddAvailUntilToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :avail_to, :date
  end
end
