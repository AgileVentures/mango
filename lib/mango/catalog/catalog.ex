defmodule Mango.Catalog do
  alias Mango.Catalog.Product

  def list_products do
    Product 
    |> Mango.Repo.all
  end
  
  def list_seasonal_products do
    list_products() 
    |> Enum.filter(&(&1.is_seasonal))
  end

  def get_category_products(name) do
    list_products()
    |> Enum.filter(&(&1.category == name))
  end
  
  def get_product!(id), do: Product |> Mango.Repo.get!(id)
end