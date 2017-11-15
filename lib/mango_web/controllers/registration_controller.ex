defmodule MangoWeb.RegistrationController do
  use MangoWeb, :controller
  alias Mango.CRM
  
  def new(conn, _) do
    changeset = CRM.build_customer()
    render(conn, "new.html", changeset: changeset)
  end
  
  def create conn, %{"registration" => registration_params} do
    # CRM.create_customer(registration_params)
    render conn, "create.html", flag: "flag"
  end
  
end