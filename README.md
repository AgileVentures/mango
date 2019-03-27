# Mango
## SET UP .env
Feel free to skip to the next section if you are using the default postgres username and password as you do not have to set this up.
If you are not using the default postgres username and password, please follow the steps below:
The postgres database Username and Password are configured using a .env file. First copy the content of the .env.dev file in your root directory to a .env file as below
```
cp .env.dev .env
```
Update the content for the values with the correct username and password, for instance, if the username for my database is `correct_username` and password is `correct_password` I would update as below
```
export DB_USERNAME="correct_username"
export DB_PASSWORD="correct_password"
```

## BEFORE EVERY SESSION ON C9, RUN THESE 3 COMMANDS:

To start postgresql (on c9)

```
sudo service postgresql start
```

To start phantomjs:

```
phantomjs --webdriver=8082
```

To start your Phoenix server AND the iex shell:
```
iex -S mix phx.server
```

To install phantomjs:

```
sudo npm -g install phantomjs-prebuilt
```

Might need to add `--unsafe-perm` to the above command



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
