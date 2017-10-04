defmodule MangoWeb.CategoryController do
  use MangoWeb, :controller
  
  alias Mango.Catalog
  
  def index(conn, %{"name" => name}) do
    products = Catalog.get_category_products(name)
  
    # conn
    # |> assign(:name, name)
    # |> render 
    
    render conn, name: name, products: products
  end
end