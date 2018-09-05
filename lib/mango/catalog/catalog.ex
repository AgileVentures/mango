defmodule Mango.Catalog do
  alias Mango.Catalog.Product

  def list_products do
    # product1 = %Product{ name: "Tomato", price: 50, is_seasonal: false, category: "vegetables" }
    # product2 = %Product{ name: "Apple", price: 100, is_seasonal: true, category: "fruits" }
    # [product1, product2]
    Product 
    |> Mango.Repo.all
  end
  
  def list_seasonal_products do
    list_products() |>
    Enum.filter(fn product -> product.is_seasonal end)

    # product1 = %Product{ name: "Apple", price: 100, is_seasonal: true }
    # [product1]
  end

  def get_category_products(name) do
    list_products()
      |> Enum.filter(&( &1.category == name ))
      
    # |> Enum.filter(fn(product) -> product.category == name end)
  end
  
  def get_product!(id), do: Product |> Mango.Repo.get!(id)
end