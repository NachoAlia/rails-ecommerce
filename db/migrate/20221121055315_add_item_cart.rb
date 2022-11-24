class AddItemCart < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.timestamps
    end
    create_table :cart_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.string :amount
      t.float :total
    end
  end
end
