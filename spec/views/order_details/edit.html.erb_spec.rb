require 'spec_helper'

describe "order_details/edit" do
  before(:each) do
    @order_detail = assign(:order_detail, stub_model(OrderDetail,
      :order_id => 1
    ))
  end

  it "renders the edit order_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => order_details_path(@order_detail), :method => "post" do
      assert_select "input#order_detail_order_id", :name => "order_detail[order_id]"
    end
  end
end
