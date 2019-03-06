use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mango, MangoWeb.Endpoint,
  http: [port: 8081],
  url: [host: "localhost"],
  server: true

# Configure hound  

# Config hound for Chome headless testing
config :hound, driver: "chrome_driver",
               browser: "chrome",
               additional_capabilities: %{
               chromeOptions: %{ "args" => [
                  "--headless"
                              ]}
               }
# config :hound, driver: "phantomjs", 
#                host: "https://mastering-phoenix-framework-federicoesparza.c9users.io", 
#                port: 8082, 
#                app_host: "https://mastering-phoenix-framework-federicoesparza.c9users.io", 
#                app_port: 8081

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mango, Mango.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mango_test",
  hostname: "localhost",
  template: "template0",
  pool: Ecto.Adapters.SQL.Sandbox
