class OrdersController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @orders = Order.all
    @user = []
    if @orders.nil?
      else
      @orders.each do |order|
        @user.push User.find(order.user_id)
        @details = OrderDetail.where(order_id:order.id)
        if !@details.nil?
          @details.each do |detail|
            @product = Product.find(detail.product_id)
            @product.quantity = detail.quantities
            order.detail = @product
          end
        end
      end
    end
  end

end
