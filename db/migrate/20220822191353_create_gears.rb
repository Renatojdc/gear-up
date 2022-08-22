class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears do |t|
      t.string :sport_type
      t.string :gear_type
      t.string :description
      t.string :address
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
