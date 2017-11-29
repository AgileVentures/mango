# Context Module

defmodule Mango.CRM do
  alias Mango.CRM.Customer
  alias Mango.Repo
  
  def build_customer(attrs \\ %{}) do 
    %Customer{}
    |> Customer.changeset(attrs)
  end
  
  def create_customer(params) do
    build_customer(params) |> Repo.insert
  end
  
  def get_customer_by_email(email), do: Repo.get_by(Customer, email: email)
end