require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:admin_products, [
      Admin::Product.create!(
        name: "Name",
        description: "MyText",
        price: 2,
        category: nil,
        active: false
      ),
      Admin::Product.create!(
        name: "Name",
        description: "MyText",
        price: 2,
        category: nil,
        active: false
      )
    ])
  end

  it "renders a list of admin/products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
