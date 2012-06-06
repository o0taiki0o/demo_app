class OrderDetail < ActiveRecord::Base
  attr_accessible :order_id
  belongs_to :order
end
