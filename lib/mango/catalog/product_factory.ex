defmodule Mango.Catalog.ProductFactory do
  alias Mango.Catalog.Product
  
  def apple() do
    %Product{ 
              name:        "Apple", 
              price:       75, 
              pack_size:   "1 kg",
              sku:         "B232",
              is_seasonal: true, 
              category:    "fruits"
    }
  end
  
  def tomato() do
    %Product{ 
              name:        "Tomato", 
              price:       50, 
              is_seasonal: false, 
              category:    "vegetables" 
    }
  end
  
  def carrot() do
    %Product{ 
              name:        "Carrot", 
              pack_size:   "1 kg", 
              price:       55, 
              sku:         "A123", 
              is_seasonal: true 
    }
  end
end