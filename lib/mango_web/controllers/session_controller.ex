defmodule MangoWeb.SessionController do
  use MangoWeb, :controller
  alias Mango.CRM
  def new(conn, _params) do
   render conn, :new
  end
   
  def create(conn, %{"session" => session_params}) do
    case CRM.get_customer_by_credentials(session_params) do
    :error -> 
      conn
      |> put_flash(:error,  "Invalid username/password combination") 
      |> render("new.html")
    customer ->
      # IO.inspect conn, label: "+++++++++++++++++"
      conn
      |> assign(:current_customer, customer)
      |> put_session(:customer_id, customer.id)
      |> configure_session(renew: true)
      |> put_flash(:info,  "Login successful") 
      |> redirect(to: page_path(conn, :index))
    end
  end
  
  def delete(conn, _params) do
    clear_session(conn)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
