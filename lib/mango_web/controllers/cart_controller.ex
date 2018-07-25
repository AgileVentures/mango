defmodule MangoWeb.CartController do
  use MangoWeb, :controller
  
  def add(conn, params) do
    text(conn, "you got here")
  end
end