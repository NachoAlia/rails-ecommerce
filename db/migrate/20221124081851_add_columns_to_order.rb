class AddColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :address, :string
    add_column :orders, :state, :integer
    remove_column :orders, :total
  end
end
