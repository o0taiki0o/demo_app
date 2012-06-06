require 'spec_helper'

describe "order_details/index" do
  before(:each) do
    assign(:order_details, [
      stub_model(OrderDetail,
        :order_id => 1
      ),
      stub_model(OrderDetail,
        :order_id => 1
      )
    ])
  end

  it "renders a list of order_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
