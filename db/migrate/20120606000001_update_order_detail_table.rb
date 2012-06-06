class UpdateOrderDetailTable < ActiveRecord::Migration
   def change
    add_column :order_details, :quantities, :integer
  end

end

