class AddProductToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :product_id, :integer
  end
end