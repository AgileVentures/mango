defmodule Mango.CatalogTest do
  use Mango.DataCase
  alias Mango.{Catalog, Repo}
  alias Mango.Catalog.{Product, ProductFactory}

  setup do
    Repo.insert!(ProductFactory.tomato)
    Repo.insert!(ProductFactory.apple)
    :ok
  end
  
  test "list_products/0 returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products
    
    assert p1.name == "Tomato"
    assert p2.name == "Apple"
  end
  
  test "list_seasonal_products/0 return all seasonal products" do
    [product = %Product{}] = Catalog.list_seasonal_products
  
    assert product.name == "Apple"
  end
  
  test "get_category_products/1 returns products of the given category (fruits)" do
    [product = %Product{}] = Catalog.get_category_products("fruits")
    
    assert product.name == "Apple"
  end  
  
  test "get_category_products/1 returns products of the given category (veg)" do
    [product = %Product{}] = Catalog.get_category_products("vegetables")
    
    assert product.name == "Tomato"
  end
end