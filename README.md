# TwoCents

TwoCents is a polling service.

## Using TwoCents

### Local Machine
To start your Phoenix app:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Docker
#### Development
    docker-compose build
    docker-compose run web mix do ecto.create, ecto.migrate
    docker-compose run web mix run priv/repo/seeds.exs
    docker-compose up
#### Test
    docker-compose build
    docker-compose run -e MIX_ENV=test web mix do ecto.create, ecto.migrate
    docker-compose run -e MIX_ENV=test web sh -c "mix test"
#### Deploy
Use [Jenkins](https://statmilk.atlassian.net/wiki/display/ENG/Jenkins+Deploy).
