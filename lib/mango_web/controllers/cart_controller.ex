defmodule MangoWeb.CartController do
  use MangoWeb, :controller
  alias Mango.Sales
  alias Mango.Sales.Order
  
  # def add(conn, params) do
  #   text(conn, "you got here")
  # end

  def add(conn, %{"cart" => cart_params}) do
    cart = conn.assigns.cart 
    case Sales.add_to_cart(cart, cart_params) do
      {:ok, _} ->
        %{"product_name"=> name,"pack_size"=> size,"quantity"=> qty} = cart_params
        message = "Product added to cart - #{name}(#{size}) x #{qty} qty"
        conn
        |> put_flash(:info, message)
        |> redirect(to: page_path(conn, :index))
      {:error, _} ->
        # handle the failure
        IO.puts "Implement error handling on page 208"
    end
  end
  
  def show(conn, _params) do
    cart           = conn.assigns.cart
    cart_changeset = Sales.change_cart(cart)
    render conn, :show, cart: cart, cart_changeset: cart_changeset
  end
  
  def update(conn,  %{"order" => cart_params}) do
    cart = conn.assigns.cart 
    case Sales.update_cart(cart, cart_params) do
    {:ok, _} ->
      conn
      |> put_flash(:info, "Cart updated successfully")
      |> redirect(to: cart_path(conn, :show))
    {:error, _} ->
        conn
        |> put_flash(:info, "Error updating cart")
        |> redirect(to: cart_path(conn, :show))
    end
  end
end