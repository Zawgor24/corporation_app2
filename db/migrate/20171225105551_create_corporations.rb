class CreateCorporations < ActiveRecord::Migration[5.1]
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :avatar
      t.datetime :founded
      t.string :founder
      t.integer :revenue
      t.string :area_served
      t.integer :rating

      t.timestamps
    end
  end
end
