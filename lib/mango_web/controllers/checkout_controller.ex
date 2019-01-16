defmodule MangoWeb.CheckoutController do 
  use MangoWeb, :controller
  alias Mango.Sales
  
  def edit(conn, _params) do
    order           = conn.assigns.cart
    order_changeset = Sales.change_cart(order)
    render conn, "edit.html", order: order, order_changeset: order_changeset
  end
  
  def update(conn, _params) do
    conn
  end
end
