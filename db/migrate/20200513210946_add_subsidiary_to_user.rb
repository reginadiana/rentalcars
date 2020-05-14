class AddSubsidiaryToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :subsidiary, foreign_key: true
  end
end
