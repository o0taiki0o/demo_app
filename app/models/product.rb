class Product < ActiveRecord::Base
  attr_accessible :category_id, :name, :price, :quantity
  belongs_to :category
  @quantity = 0
  def quantity
    @quantity
  end

  def quantity=(value)
    @quantity = value
  end

  def nums
    @nums
  end

  def nums=(value)
    @nums = value
  end
end
