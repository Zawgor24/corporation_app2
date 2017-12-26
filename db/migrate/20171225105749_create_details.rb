class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :name
      t.string :type
      t.integer :serial_number
      t.integer :price
      t.belongs_to :factory

      t.timestamps
    end
  end
end
