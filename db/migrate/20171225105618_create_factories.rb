class CreateFactories < ActiveRecord::Migration[5.1]
  def change
    create_table :factories do |t|
      t.string :name
      t.string :location
      t.string :avatar
      t.belongs_to :corporation, foreign_key: true

      t.timestamps
    end
  end
end
