class AddAddOnToCarRental < ActiveRecord::Migration[6.0]
  def change
    add_reference :car_rentals, :add_on, foreign_key: true
  end
end
