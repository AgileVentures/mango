defmodule MangoWeb.RegistrationController do
  use MangoWeb, :controller
  
  def new(conn, _) do
    render(conn, "new.html")
  end
  
end