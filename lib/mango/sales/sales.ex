defmodule Mango.Sales do 
  alias Mango.Repo
  alias Mango.Sales.Order
  
  def create_cart do
    %Order{status: "In Cart"} 
    |> Repo.insert!() 
  end
  
  def get_cart(id) do 
    Order 
    |> Repo.get_by(id: id, status: "In Cart")
  end
  
  def add_to_cart(%Order{line_items: []} = cart, cart_params) do 
    updated_line_items = %{line_items: [cart_params]}
    update_cart(cart, updated_line_items)
  end
   
  def add_to_cart(%Order{line_items: existing_line_items} = cart, cart_params) do
    new_item = %{
      product_id: String.to_integer(cart_params["product_id"]),
      quantity: String.to_integer(cart_params["quantity"])
    }
    existing_line_items = existing_line_items 
                          |> Enum.map(&Map.from_struct/1)

    attrs = %{line_items: [new_item | existing_line_items]}
    update_cart(cart, attrs)
  end
  
  def update_cart(%Order{} = cart_to_update, %{} = updated_cart_attrs) do
    cart_to_update
    |> Order.changeset(updated_cart_attrs)
    |> Repo.update
  end
  
  def change_cart(%Order{} = cart) do
    cart
    |> Order.changeset(%{})
  end
  
  def confirm_order(%Order{} = order, attrs) do 
    attrs = Map.put(attrs, "status", "Confirmed")
    order
    |> Order.checkout_changeset(attrs)
    |> Repo.update()
  end
end