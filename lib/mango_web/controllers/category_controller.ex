defmodule MangoWeb.CategoryController do
  use MangoWeb, :controller
  
  def index(conn, %{"name" => name}) do
    # conn
    # |> assign(:name, name)
    # |> render 
    
    render conn, name: name
  end
end