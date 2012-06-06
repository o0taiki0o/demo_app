class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  before_filter :signed_in_user
  @@categories = Category.all
  
  def self.categories
    @@categories
  end
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
    @products = Product.find :all, conditions: ["category_id = ?",params[:id]]
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  def buy
    @product = Product.find(params[:id])
  end

  def makeOrder
    @order = Order.new
    @order.user_id = current_user.id
    @order.save
    @order_details = OrderDetail.new
    @order_details.order_id = @order.id
    @order_details.product_id = params[:id]
    @order_details.quantities = 1
    @order_details.save
    @product = Product.find(params[:id])
  end

  def save_order
    @order = Order.new
    @order.user_id = current_user.id
    @order.save
    session[:cart].keys.each do |id|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.product_id = id
      @order_detail.quantities = session[:cart][id]
      @order_detail.save
    end
    @products = Product.where(id:session[:cart].keys)
    @products.each do |product|
      product.quantity = session[:cart][product.id]
    end
    @sum = 0
    session[:cart] = Hash.new
  end

  def cart
    if session[:cart].empty? 
      @products = nil
      else
      @products = Product.where(id:session[:cart].keys)
    end
    @sum = 0
  end
end
