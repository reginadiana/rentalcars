class RemoveStatusFromCars < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :status, :integer
  end
end
