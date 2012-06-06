class Cart
  attr_accessor :list
  def add_to_cart(id)
    list.push id
  end
end