# Mango

## This is part of AgileVentures' Premium Mob

**Note**, to request a free trial of our **Elixir/Phoenix Mob Wednesdays, 1pm UTC**, please check out [free trial](https://www.agileventures.org/premium-mob-offer)

## Collaborating - Clone Repo

At the command prompt, type:
```
$ git clone https://github.com/AgileVentures/mango.git && cd mango
```

  * Ask to be added as a collaborator:
    * Ask @mattwr18, @aonomike, or @federico in our [AgileVentures.org Slack channel](https://agileventures.slack.com/messages/premium_extra)

## Install Erlang and Elixir

To work on this project, you will want to make sure you have Erlang and Elixir installed locally.
A great way to manage dependencies is with `asdf`. 

Follow the intructions found here for how to [Install asdf-vm](https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm)

Don't forget to [Add asdf to your PATH](https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell) and **restart** your shell (opening a new terminal is the easiest way to restart).

You can have a look at the `.tool-versions` file and you will see that the project is currently using `Elixir 1.7`, which is compatible with `Erlang 20.3`.

After you have `asdf` installed correctly, you can run:

```
$ asdf plugin-add elixir
$ asdf plugin-add erlang
$ asdf install
```

This will install the elixir and erlang versions indicated in the [.tool-versions](.tool-versions) file.

You can activate the Elixir used in this project with:

Activate locally in the current folder with:

```
$ asdf local elixir 1.7-otp-20
```

Install local.hex and local.rebar:

```
$ mix local.hex --force
$ mix local.rebar --force
```


## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Compile the dependencies with `mix deps.compile`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm ci`
  * Move to the root directory with `cd ..` and start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

Now you are fully set up and can join us as a collaborator :smile:

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

## Running tests
End to end tests use `chromedriver` to run. You will have to get set up with the chrome driver using the steps below: 
  1. For mac os, [follow these instructions to install chromedriver](https://www.kenst.com/2015/03/installing-chromedriver-on-mac-osx/).

  2. For Debian based Linux distributions(Ubuntu), run the command `sudo apt install chromium-chromedriver` see package details [here](https://packages.ubuntu.com/xenial/chromium-chromedriver).

To run the tests make sure you run the commands below
  * Install dependencies `mix deps.get`
  * Run the tests `mix test`



## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
