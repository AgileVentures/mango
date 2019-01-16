defmodule MangoWeb.CheckoutController do 
  use MangoWeb, :controller
  alias Mango.Sales
  
  def edit(conn, _params) do
    order           = conn.assigns.cart
    order_changeset = Sales.change_cart(order)
    # conn.assign(conn, :order, order)
    render conn, "edit.html", order: order, order_changeset: order_changeset
  end
  
  def update(conn, _params) do
    order           = conn.assigns.cart
    Sales.update_cart(order, %{garbage_key: "I'm garbage!"})
    render conn, "edit.html"
  end
end
