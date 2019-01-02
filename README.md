# Mango

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
