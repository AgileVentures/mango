defmodule MangoWeb.SessionController do
  use MangoWeb, :controller

 def new(conn, _params) do
   render conn, :new
 end
 
 def create(conn, _params) do
    conn
    |> put_flash(:info,  "Login successful") 
    |> redirect(to: page_path(conn, :index))
 end
end
