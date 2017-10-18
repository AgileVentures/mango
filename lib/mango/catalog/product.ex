defmodule Mango.Catalog.Product do
  use Ecto.Schema
  
  schema "products" do
      field :name, :string 
      field :price, :decimal
      field :sku, :string
      field :is_seasonal, :boolean, default: false
      field :image, :string
      field :pack_size, :string
      field :category, :string
  
      timestamps()
  end
  
end