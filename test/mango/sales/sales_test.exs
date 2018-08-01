defmodule Mango.SalesTest do
  use Mango.DataCase

  alias Mango.Sales
  alias Mango.Sales.Order

  test "create_cart" do
    assert %Order{status: "In Cart"} = Sales.create_cart
  end
  
  @tag :skip
  test "get_cart/1" do
    cart1 = Sales.create_cart
    cart2 = Sales.get_cart(cart1.id)
    assert cart1.id == cart2.id
  end
end