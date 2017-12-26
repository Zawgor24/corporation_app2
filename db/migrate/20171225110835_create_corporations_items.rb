class CreateCorporationsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :corporations_items, id: false do |t|
      t.integer :corporation_id
      t.integer :item_id
    end
  end
end
