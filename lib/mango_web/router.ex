defmodule MangoWeb.Router do
  use MangoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  
  pipeline :frontend do 
    plug MangoWeb.Plugs.LoadCustomer
    plug MangoWeb.Plugs.FetchCart
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Routes that don't require authentication
  scope "/", MangoWeb do
    pipe_through [:browser, :frontend]
    
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    
    get "/", PageController, :index
    get "/categories/:name", CategoryController, :index
    
    post "/cart", CartController, :add
    get "/cart", CartController, :show
    put "/cart", CartController, :update
  end
  
  # Routes that do require authentication
  scope "/", MangoWeb do
    pipe_through [:browser, :frontend, MangoWeb.Plugs.AuthenticateCustomer]
  
    get "/logout", SessionController, :delete
    get "/checkout", CheckoutController, :edit
  end
  # Other scopes may use custom stacks.
  # scope "/api", MangoWeb do
  #   pipe_through :api
  # end
end
