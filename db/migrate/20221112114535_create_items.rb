class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :priceUnit
      t.integer :stockAmount
      t.boolean :available
      t.string :image_url
      t.timestamps
    end
  end
end
