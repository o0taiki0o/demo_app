class Order < ActiveRecord::Base
  attr_accessible :id, :user_id
  has_many :order_detail
  @detail = []
  def detail
    @detail
  end
  def detail=(value)
    if(@detail.nil?)
      @detail = []
    end
    @detail.push value
  end
end
