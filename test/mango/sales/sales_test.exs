defmodule Mango.SalesTest do
  use Mango.DataCase

  alias Mango.Sales
  alias Mango.Sales.Order
  alias Mango.Catalog.Product
  
  test "create_cart" do
    assert %Order{status: "In Cart"} = Sales.create_cart
  end
  
  # @tag :skip
  test "get_cart/1" do
    created_cart   = Sales.create_cart
    retrieved_cart = Sales.get_cart(created_cart.id)
    assert created_cart.id == retrieved_cart.id
  end
  
  @tag :skip
  test "add_to_cart/2" do
    product = %Product{
      name: "Tomato",
      pack_size: "1 kg",
      price: 55,
      sku: "A123",
      is_seasonal: false, category: "vegetables" } |> Repo.insert!
    cart = Sales.create_cart
    {:ok, cart} = Sales.add_to_cart(cart, %{"product_id" => product.id, "quantity" => "2"})
    
    assert [line_item] = cart.line_items
    assert line_item.product_id == product.id
    assert line_item.product_name == "Tomato"
    assert line_item.pack_size == "1 kg"
    assert line_item.quantity == 2
    assert line_item.unit_price == Decimal.new(product.price)
    assert line_item.total == Decimal.mult(Decimal.new(product.price), Decimal.new(2))
  end
end