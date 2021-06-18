# Changelog

## 2021-03-30

Initial Release, v0.1.0

## 2021-06-16

Updated mix files for newer versions of Phoenix, Bamboo

apps/auth_web/mix.exs

```bash
$ mix deps.get
warning: found quoted atom "tlsv1" but the quotes are not required. Atoms made exclusively of ASCII letters, numbers, and underscore do not require quotes
  config/dev.exs:91

Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  bamboo 2.0.2
  bamboo_smtp 4.0.0
  bcrypt_elixir 2.3.0
  certifi 2.6.1
  comeonin 5.3.2
  connection 1.1.0
  cowboy_telemetry 0.3.1
  db_connection 2.3.1
  decimal 2.0.0
  ecto 3.5.8
  ecto_sql 3.5.4
  elixir_make 0.6.2
  file_system 0.2.10
  floki 0.30.0
  gen_smtp 1.1.1
  gettext 0.18.2
  hackney 1.17.4
  html_entities 0.5.2
  hut 1.3.0
  idna 6.1.1
  jason 1.2.2
  metrics 1.0.1
  mimerl 1.2.0
  parse_trans 3.3.1
  phoenix_ecto 4.2.1
  phoenix_html 2.14.3
  phoenix_live_dashboard 0.4.0
  phoenix_live_reload 1.3.0
  phoenix_live_view 0.15.4
  phoenix_pubsub 2.0.0
  phx_gen_auth 0.7.0
  plug 1.11.1
  plug_crypto 1.2.2
  postgrex 0.15.8
  ssl_verify_fun 1.1.6
  telemetry_metrics 0.6.0
  telemetry_poller 0.5.1
  tzdata 1.1.0
  unicode_util_compat 0.7.0
Upgraded:
  cowboy 2.8.0 => 2.9.0
  cowlib 2.9.1 => 2.11.0
  mime 1.5.0 => 1.6.0
  phoenix 1.5.8 => 1.5.9
  plug_cowboy 2.4.1 => 2.5.0
  ranch 1.7.1 => 1.8.0
  telemetry 0.4.2 => 0.4.3
* Updating phoenix (Hex package)
* Updating plug_cowboy (Hex package)
* Updating cowboy (Hex package)
* Updating telemetry (Hex package)
* Updating mime (Hex package)
* Updating cowlib (Hex package)
* Updating ranch (Hex package)
```

Then ran all tests.

Then Bamboo, had to do 2.1.0 vs. 2.2.0

apps/auth/mix.exs

```bash
$ mix deps.get
warning: found quoted atom "tlsv1" but the quotes are not required. Atoms made exclusively of ASCII letters, numbers, and underscore do not require quotes
  config/dev.exs:91

Resolving Hex dependencies...

Failed to use "bamboo" (version 2.2.0) because
  apps/auth/mix.exs requires ~> 2.2.0
  bamboo_smtp (version 4.0.1) requires ~> 2.1.0

** (Mix) Hex dependency resolution failed, change the version requirements of your dependencies or unlock them (by using mix deps.update or mix deps.unlock). If you are unable to resolve the conflicts you can try overriding with {:dependency, "~> 1.0", override: true}
```

```bash
$ mix deps.get
warning: found quoted atom "tlsv1" but the quotes are not required. Atoms made exclusively of ASCII letters, numbers, and underscore do not require quotes
  config/dev.exs:91

Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  bcrypt_elixir 2.3.0
  certifi 2.6.1
  comeonin 5.3.2
  connection 1.1.0
  cowboy 2.9.0
  cowboy_telemetry 0.3.1
  cowlib 2.11.0
  db_connection 2.3.1
  decimal 2.0.0
  ecto 3.5.8
  ecto_sql 3.5.4
  elixir_make 0.6.2
  file_system 0.2.10
  floki 0.30.0
  gen_smtp 1.1.1
  gettext 0.18.2
  hackney 1.17.4
  html_entities 0.5.2
  hut 1.3.0
  idna 6.1.1
  jason 1.2.2
  metrics 1.0.1
  mime 1.6.0
  mimerl 1.2.0
  parse_trans 3.3.1
  phoenix 1.5.9
  phoenix_ecto 4.2.1
  phoenix_html 2.14.3
  phoenix_live_dashboard 0.4.0
  phoenix_live_reload 1.3.0
  phoenix_live_view 0.15.4
  phoenix_pubsub 2.0.0
  phx_gen_auth 0.7.0
  plug 1.11.1
  plug_cowboy 2.5.0
  plug_crypto 1.2.2
  postgrex 0.15.8
  ranch 1.8.0
  ssl_verify_fun 1.1.6
  telemetry 0.4.3
  telemetry_metrics 0.6.0
  telemetry_poller 0.5.1
  tzdata 1.1.0
  unicode_util_compat 0.7.0
Upgraded:
  bamboo 2.0.2 => 2.1.0
  bamboo_smtp 4.0.0 => 4.0.1
* Updating bamboo (Hex package)
* Updating bamboo_smtp (Hex package)
```

Again all tests passed.