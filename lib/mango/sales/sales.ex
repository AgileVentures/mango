defmodule Mango.Sales do 
  
  alias Mango.Sales.Order
  def create_cart do
    %Order{status: "In Cart"}
  end
end