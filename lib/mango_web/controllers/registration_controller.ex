defmodule MangoWeb.RegistrationController do
  use MangoWeb, :controller
  alias Mango.CRM
  # alias Auroville.ResidenceService, as: RS
  import Auroville.ResidenceService, only: [list_areas: 0]
  
  def new(conn, _) do
    changeset = CRM.build_customer()
    render(conn, :new, changeset: changeset, residence_areas: list_areas)
  end
  
  def create conn, %{"registration" => registration_params} do
    # CRM.create_customer(registration_params)
    case CRM.create_customer(registration_params) do
      {:ok, _} -> 
        conn
        |> put_flash(:info,  "Registration successful") 
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} -> 
        conn 
        |> render(:new, changeset: changeset, residence_areas: list_areas)    
    end
  end
  
end