# Actl

Phoenix LiveView Umbrella application built using Phoenix authentication
generator.

## Purpose(s)

Highlights use of phx.gen.auth v0.7.0.
Wlll likely be incorporated into Phoenix Framework 1.6.

Intended as reference, basis/foundation for future projects.

The plan is to update to latest/greatest as new component releases become
available, especially Phoenix framework, Phoenix authentication generator
and Phoenix LiveView.
Perhaps we should set up watching on these repos.

## Prerequisites

- Postgres
- Elixir/Erlang
- Phoenix Framework v1.5.8

## Tutorial Used

Built from the following excellent tutorial from Nick Riebeek, Experimenting with Code:

[Phoenix Authentication with Phx.Gen.Auth - Part 1](https://experimentingwithcode.com/phoenix-authentication-with-phx-gen-auth-part-1/)

[Phoenix Authentication with Phx.Gen.Auth - Part 2](https://experimentingwithcode.com/phoenix-authentication-with-phx-gen-auth-part-2/)

Nick adds the following:  

- Secure page for testing http://localhost:4000/secured_page

- Password confirmation on registration  

- Ability to block/unblock a user

- Email confirmation via Bamboo

- Unit test updates, additions

## Initial Creation

### Differences from Tutorial

Auth is a Phoenix Umbrella (--umbrella flag), LiveView (--live flag) application.

```bash
mix phx.new auth --umbrella --live
```

```bash
mv auth_umbrella auth
cd auth
```

## Add Generator

Is generator part of Phoenix?

```bash
$ mix phx.gen.auth Accounts User users
==> auth_web
Compiling 11 files (.ex)
Generated auth_web app
** (Mix) The task "phx.gen.auth" could not be found. Did you mean "phx.gen.html"?
```

Verify dependencies.

```bash
$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  connection 1.1.0
  cowboy 2.8.0
  cowboy_telemetry 0.3.1
  cowlib 2.9.1
  db_connection 2.3.1
  decimal 2.0.0
  ecto 3.5.8
  ecto_sql 3.5.4
  file_system 0.2.10
  floki 0.30.0
  gettext 0.18.2
  html_entities 0.5.2
  jason 1.2.2
  mime 1.5.0
  phoenix 1.5.8
  phoenix_ecto 4.2.1
  phoenix_html 2.14.3
  phoenix_live_dashboard 0.4.0
  phoenix_live_reload 1.3.0
  phoenix_live_view 0.15.4
  phoenix_pubsub 2.0.0
  plug 1.11.1
  plug_cowboy 2.4.1
  plug_crypto 1.2.2
  postgrex 0.15.8
  ranch 1.7.1
  telemetry 0.4.2
  telemetry_metrics 0.6.0
  telemetry_poller 0.5.1
```

Add latest generator (release v0.7.0) to our mix file.
The one that contains Phoenix framework.

```bash
$ mix deps.get
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  connection 1.1.0
  cowboy 2.8.0
  cowboy_telemetry 0.3.1
  cowlib 2.9.1
  db_connection 2.3.1
  decimal 2.0.0
  ecto 3.5.8
  ecto_sql 3.5.4
  file_system 0.2.10
  floki 0.30.0
  gettext 0.18.2
  html_entities 0.5.2
  jason 1.2.2
  mime 1.5.0
  phoenix 1.5.8
  phoenix_ecto 4.2.1
  phoenix_html 2.14.3
  phoenix_live_dashboard 0.4.0
  phoenix_live_reload 1.3.0
  phoenix_live_view 0.15.4
  phoenix_pubsub 2.0.0
  plug 1.11.1
  plug_cowboy 2.4.1
  plug_crypto 1.2.2
  postgrex 0.15.8
  ranch 1.7.1
  telemetry 0.4.2
  telemetry_metrics 0.6.0
  telemetry_poller 0.5.1
New:
  phx_gen_auth 0.7.0
* Getting phx_gen_auth (Hex package)
```

Let's try again

```bash
$ mix phx.gen.auth Accounts User users
==> phx_gen_auth
Compiling 4 files (.ex)
Generated phx_gen_auth app
** (Mix) mix phx.gen.auth can only be run inside an application directory
```

Phoenix is smart.
Where are we? 

```
$ pwd
auth/apps
```

Let's try non-web application.

```bash
$ cd apps/auth
```

Let's just use the same context for now.
"Naming is hard but renaming should not be."

```bash
$ mix phx.gen.auth Accounts User users
Compiling 3 files (.ex)
Generated auth app
** (Mix) The task "phx.gen.auth" could not be found
```

We need to be in the same app folder that contains Phoenix framework and
generator, the _web folder.

```bash
$ cd ../auth_web
$ mix phx.gen.auth Accounts User users
Compiling 11 files (.ex)
Generated auth_web app
* creating /Projects/auth/apps/auth/priv/repo/migrations/20210328172121_create_users_auth_tables.exs
* creating /Projects/auth/apps/auth/lib/auth/accounts/user_notifier.ex
* creating /Projects/auth/apps/auth/lib/auth/accounts/user.ex
* creating /Projects/auth/apps/auth/lib/auth/accounts/user_token.ex
* creating lib/auth_web/controllers/user_auth.ex
* creating test/auth_web/controllers/user_auth_test.exs
* creating lib/auth_web/views/user_confirmation_view.ex
* creating lib/auth_web/templates/user_confirmation/new.html.eex
* creating lib/auth_web/controllers/user_confirmation_controller.ex
* creating test/auth_web/controllers/user_confirmation_controller_test.exs
* creating lib/auth_web/templates/layout/_user_menu.html.eex
* creating lib/auth_web/templates/user_registration/new.html.eex
* creating lib/auth_web/controllers/user_registration_controller.ex
* creating test/auth_web/controllers/user_registration_controller_test.exs
* creating lib/auth_web/views/user_registration_view.ex
* creating lib/auth_web/views/user_reset_password_view.ex
* creating lib/auth_web/controllers/user_reset_password_controller.ex
* creating test/auth_web/controllers/user_reset_password_controller_test.exs
* creating lib/auth_web/templates/user_reset_password/edit.html.eex
* creating lib/auth_web/templates/user_reset_password/new.html.eex
* creating lib/auth_web/views/user_session_view.ex
* creating lib/auth_web/controllers/user_session_controller.ex
* creating test/auth_web/controllers/user_session_controller_test.exs
* creating lib/auth_web/templates/user_session/new.html.eex
* creating lib/auth_web/views/user_settings_view.ex
* creating lib/auth_web/templates/user_settings/edit.html.eex
* creating lib/auth_web/controllers/user_settings_controller.ex
* creating test/auth_web/controllers/user_settings_controller_test.exs
* creating /Projects/auth/apps/auth/lib/auth/accounts.ex
* injecting /Projects/auth/apps/auth/lib/auth/accounts.ex
* creating /Projects/auth/apps/auth/test/auth/accounts_test.exs
* injecting /Projects/auth/apps/auth/test/auth/accounts_test.exs
* creating /Projects/auth/apps/auth/test/support/fixtures/accounts_fixtures.ex
* injecting /Projects/auth/apps/auth/test/support/fixtures/accounts_fixtures.ex
* injecting test/support/conn_case.ex
* injecting /Projects/auth/config/test.exs
* injecting /Projects/auth/apps/auth/mix.exs
* injecting lib/auth_web/router.ex
* injecting lib/auth_web/router.ex - imports
* injecting lib/auth_web/router.ex - plug
* injecting lib/auth_web/templates/layout/root.html.leex

Please re-fetch your dependencies with the following command:

    mix deps.get

Remember to update your repository by running migrations:

  $ mix ecto.migrate
```

Looks like we're in business, we have generated authentication code in our
project.

## Migrations

Let's mot migrate just yet.

### Timestamps

Before we run migrations we want to specify microseconds.

```elixir
defmodule Auth.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:users) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :confirmed_at, :utc_datetime_usec
      timestamps([type: :utc_datetime_usec])
    end

    create unique_index(:users, [:email])

    create table(:users_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      add :sent_to, :string
      timestamps([type: :utc_datetime_usec, updated_at: false])
    end

    create index(:users_tokens, [:user_id])
    create unique_index(:users_tokens, [:context, :token])
  end
end
```

Looks like there may be some improvements coming for Phoenix timestamps.

https://github.com/aaronrenner/phx_gen_auth/issues/105

## Secure Page

We follow the tutorial and make a page folder and secure page.

```bash
mkdir apps/auth_web/lib/auth_web/templates/page
touch apps/auth_web/lib/auth_web/templates/page/secure.html.eex
```

Also need PageView

```elixir
defmodule AuthWeb.PageView do
  use AuthWeb, :view
end
```

## Add Password Confirmation

Varies a little from tutorial, user.ex, registration changset needs opts param:

```elixir
  def registration_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_confirmation(:password, message: "does not match password")
    |> validate_email()
    |> validate_password(opts)
  end
  ```
  