class CreateWorkshops < ActiveRecord::Migration[5.1]
  def change
    create_table :workshops do |t|
      t.string :name
      t.belongs_to :factory, foreign_key: true

      t.timestamps
    end
  end
end
