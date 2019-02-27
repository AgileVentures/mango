defmodule MangoWeb.CheckoutController do 
  use MangoWeb, :controller
  alias Mango.Sales
  
  def edit(conn, _params) do
    order           = conn.assigns.cart
    order_changeset = Sales.change_cart(order)
    render conn, "edit.html", order: order, order_changeset: order_changeset
  end
  
  def update(conn, %{"order" => order_params}) do
    order           = conn.assigns.cart
    order_params    = put_customer_data_in_params(conn, order_params)
    case Sales.confirm_order(order, order_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Your order has been confirmed")
        |> redirect(to: "/")
      {:error, order_changeset} -> 
        conn
        |> put_flash(:error, "Problem updating")
        |> render("edit.html", order_changeset: order_changeset, order: order)
    end
  end
  
  def put_customer_data_in_params(conn, params) do
    customer = conn.assigns.current_customer
    params
    |> Map.put("customer_id", customer.id)
    |> Map.put("customer_name", customer.name)
    |> Map.put("residence_area", customer.residence_area)
    |> Map.put("email", customer.email)
  end
end
