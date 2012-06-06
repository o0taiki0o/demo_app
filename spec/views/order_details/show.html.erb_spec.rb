require 'spec_helper'

describe "order_details/show" do
  before(:each) do
    @order_detail = assign(:order_detail, stub_model(OrderDetail,
      :order_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
