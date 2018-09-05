defmodule Mango.Sales do 
  alias Mango.Repo
  alias Mango.Sales.Order
  
  def create_cart do
    %Order{status: "In Cart"} 
    |> Repo.insert!() 
  end
  
  def get_cart(id) do 
    Order 
    |> Repo.get_by!(id: id, status: "In Cart")
  end
  
  def add_to_cart(%Order{line_items: []} = cart, cart_params) do 
    updated_line_items = %{line_items: [cart_params]}
    update_cart(cart, updated_line_items)
  end
  
  def update_cart(%Order{} = cart_to_update, %{} = updated_cart_attrs) do
    cart_to_update
    |> Order.changeset(updated_cart_attrs)
    |> Repo.update
  end
end