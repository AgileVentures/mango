defmodule MangoWeb.Acceptance.OrderTest do
  Mango.DataCase
  Hound.Helpers
  
  alias Mango.Repo
  
  hound_session()
  
  setup do
    #To Do create a factory for order
    Repo.insert(%Order{})
  end
end