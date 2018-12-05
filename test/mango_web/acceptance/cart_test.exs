defmodule MangoWeb.Acceptance.CartTest do
   use Mango.DataCase
   use Hound.Helpers
   
   alias Mango.Repo
   alias Mango.Catalog.{Product, ProductFactory}

   hound_session()
   
   setup do
      Repo.insert!(ProductFactory.carrot)
      Repo.insert!(ProductFactory.apple)
      :ok
   end
   
   test "presence of cart form for each product" do
      navigate_to("/")
      
      products = find_all_elements(:css, ".product")
      
      assert Enum.count(products) > 0
      products |> Enum.each(fn(product) ->
                    button = find_within_element(product, :tag, "button")
                    assert visible_text(button) == "Add to cart"
                  end)
   end
   
   test "add to cart" do
     navigate_to("/")
    #  take_screenshot()
     [product | _rest] = find_all_elements(:css, ".product.thumbnail")
     
     product_name = find_within_element(product, :name, "cart[product_name]")
                    |> attribute_value("value")
     pack_size    = find_within_element(product, :name, "cart[pack_size]")
                    |> attribute_value("value")
     
     find_within_element(product, :name, "cart[quantity]") 
     |> fill_field(2)

     find_within_element(product, :tag, "button") 
     |> click
     
    #  message = find_element(:css, ".alert") |> visible_text()
    #  assert message == "Product added to cart - #{product_name}(#{pack_size}) x 2 qty"
     message = find_element(:css, ".alert-success")
              |> visible_text()
    assert message =~ "Product added to cart - #{product_name}(#{pack_size}) x 2 qty"
   end
end