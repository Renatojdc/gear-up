class AddAmountToGears < ActiveRecord::Migration[7.0]
  def change
    add_column :gears, :amount, :integer
  end
end
