defmodule MangoWeb.CheckoutController do 
  use MangoWeb, :controller
  alias Mango.Sales
  
  def edit(conn, _params) do
    order           = conn.assigns.cart
    order_changeset = Sales.change_cart(order)
    # conn.assign(conn, :order, order)
    render conn, "edit.html", order: order, order_changeset: order_changeset
  end
  
  def update(conn, %{"order" => order_params}) do
    order           = conn.assigns.cart
    order_changeset = Sales.confirm_order(order, order_params)
    # Sales.update_cart(order, %{garbage_key: "I'm garbage!"})
    case Sales.confirm_order(order, order_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Your order has been confirmed")
        |> redirect_to "/"
      {:error, order_changeset} -> 
        conn
        |> put_flash(:error, "Problem updating")
        |> render conn, "edit.html", order_changeset: order_changeset
    end
  end
end
