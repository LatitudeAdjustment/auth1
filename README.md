# Auth

Phoenix Umbrella application (with LiveView) built using Phoenix authentication
generator.

## Purpose(s)

Highlights use of phx.gen.auth v0.7.0.
Likely to be incorporated into Phoenix Framework 1.6.

Intended as reference, basis/foundation for future projects.

The plan is to update to latest/greatest as new component releases become
available, especially Phoenix framework, Phoenix authentication generator
and Phoenix LiveView.
Perhaps we should set up watching on these repos.

## Prerequisites

- Postgres
- Elixir/Erlang
- Phoenix Framework v1.5.8

## Credits

Thanks to José Valim, Aaron Renner for creating the Phoenix authentication
generator.

https://hexdocs.pm/phx_gen_auth/overview.html

https://github.com/aaronrenner/phx_gen_auth

### Tutorial Used

Thanks also to Nick Riebeek, "Experimenting with Code", for his excellent
tutorial used to build this project.

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
It won't let us run the generator in the wrong folder.

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
We would like to change the timestamp type first.

### Migrations - Timestamps

Before we run migrations we want to specify microseconds.

The User schema and functions that related to confirmed_at will also have to be
changed.

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

Varies a little from tutorial, user.ex, registration changeset needs opts
param:

```elixir
def registration_changeset(user, attrs, opts \\ []) do
  user
  |> cast(attrs, [:email, :password])
  |> validate_confirmation(:password, message: "does not match password")
  |> validate_email()
  |> validate_password(opts)
end
```

## Registration Workflow

Update workflow, tests for registration confirmation

## Lock/Unlock User

Eventually this will likely be part of an administration interface.
For now we can achive this via iex.

```elixir
iex> Auth.Accounts.get_user_by_email("bob@example.com") |> Auth.Accounts.lock_user() 
[debug] QUERY OK source="users" db=53.9ms queue=1.3ms idle=1076.4ms
SELECT u0."id", u0."email", u0."hashed_password", u0."confirmed_at", u0."locked_at", u0."inserted_at", u0."updated_at" FROM "users" AS u0 WHERE (u0."email" = $1) ["bob@example.com"]
[debug] QUERY OK db=0.3ms idle=1145.9ms
begin []
[debug] QUERY OK db=0.8ms
UPDATE "users" SET "locked_at" = $1, "updated_at" = $2 WHERE "id" = $3 [~U[2021-03-29 02:29:07.915301Z], ~N[2021-03-29 02:29:07], 1]
[debug] QUERY OK source="users_tokens" db=0.6ms
DELETE FROM "users_tokens" AS u0 WHERE (u0."user_id" = $1) [1]
[debug] QUERY OK db=26.7ms
commit []
{:ok,
 #Auth.Accounts.User<
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   confirmed_at: nil,
   email: "bob@example.com",
   hashed_password: "$2b$12$.yePIrjSAaaQ791J8hZbrOZ0p.iEKyjR2WEBQziPCwlZQl1t56N6i",
   id: 1,
   inserted_at: ~N[2021-03-28 19:17:48],
   locked_at: ~U[2021-03-29 02:29:07.915301Z],
   updated_at: ~N[2021-03-29 02:29:07],
   ...
 >}
```

```elixir
iex> Auth.Accounts.get_user_by_email("bob@example.com") |> Auth.Accounts.unlock_user()
[debug] QUERY OK source="users" db=0.8ms idle=1071.2ms
SELECT u0."id", u0."email", u0."hashed_password", u0."confirmed_at", u0."locked_at", u0."inserted_at", u0."updated_at" FROM "users" AS u0 WHERE (u0."email" = $1) ["bob@example.com"]
[debug] QUERY OK db=1.2ms queue=0.4ms idle=1072.4ms
UPDATE "users" SET "locked_at" = $1, "updated_at" = $2 WHERE "id" = $3 [nil, ~N[2021-03-29 02:32:18], 1]
{:ok,
 #Auth.Accounts.User<
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   confirmed_at: ~N[2021-03-29 02:30:57],
   email: ""bob@example.com"",
   hashed_password: "$2b$12$.yePIrjSAaaQ791J8hZbrOZ0p.iEKyjR2WEBQziPCwlZQl1t56N6i",
   id: 1,
   inserted_at: ~N[2021-03-28 19:17:48],
   locked_at: nil,
   updated_at: ~N[2021-03-29 02:32:18],
   ...
 >}
```

## Add Bamboo

We then added Bamboo 2.0.2 for email notification replacement of console based notifier.

There was a small gotcha on Mailer.deliver_now!().
The tuple version requires Mailer.deliver_now!(), with exclamation point.

https://hexdocs.pm/bamboo/readme.html

https://github.com/thoughtbot/bamboo

## Add Bamboo SMTP

https://github.com/fewlinesco/bamboo_smtp

UserNotifier, the following address wil not work.   

@from_address "that-auth-app@example.com"

So we used:

@from_address "no-reply@foobarco.com"

The following variables are required to run Bamboo SMTP in development
environment.

export SMTP_DOMAIN=
export SMTP_USERNAME=
export SMTP_PASSWORD=
export SMTP_PORT=

The iex REPL may be used to send an email.

```elixir
iex> Auth.Accounts.UserNotifier.deliver_welcome("someperson@email.com")
[debug] Sending email with Bamboo.SMTPAdapter:

%Bamboo.Email{assigns: %{}, attachments: [], bcc: [], cc: [], from: {nil, "no-reply@foobar.com"}, headers: %{}, html_body: "<strong>Welcome to the Auth app</strong>", private: %{}, subject: "Welcome!", text_body: "Welcome to the Auth app", to: [nil: "someperson@email.com"]} 

{:ok,
 %Bamboo.Email{
   assigns: %{},
   attachments: [],
   bcc: [],
   cc: [],
   from: {nil, "no-reply@foobar.com"},
   headers: %{},
   html_body: "<strong>Welcome to the Auth app</strong>",
   private: %{},
   subject: "Welcome!",
   text_body: "Welcome to the Auth app",
   to: [nil: "someperson@email.com"]
 }}
```

## Add Timezones

Add Elixir timezone database, tzdata.

https://hexdocs.pm/tzdata/readme.html

https://github.com/lau/tzdata

## Add DateTime Utilities

Add DateTimeUtils.ex and tests.

Where exactly do utility modules belong in an umbrella application/project?

From the apps folder we created a new application named utils.

```bash
mix new utils
```

## Roadmap

### More Tests

Bamboo SMTP

### Preferences

Do we prefer Sign In to Log In?
- Sign In, Log in
- Sign Out, Log out
- Sign Up, Register

Shouldn't all/both words in these phrases be capitalized when presented to user?
  