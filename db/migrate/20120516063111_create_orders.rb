class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :id
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
