# README

## Layout

The application is setup like a typical Rails application with a couple of exceptions:

* `components/` - Contains the various habitat plans necessary for building and deploying the application

## Deployment

Deployment is handled via habitat packages.

# Install habitat

```bash
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash
```

If you have never configured habitat before be sure to follow the instructions at https://habitat.sh on how to get started.

## Building hab packages

```bash
hab studio enter
build components/yarn
build components/supersite
build components/supersite-db
build components/supersite-web
build components/supersite-worker
```

## Setup configs

To configure the rails app a few config values need to be setup. This would be for handling settings the decryption key `master_key` for the rails secrets or specifying a `DATABASE_URL` for connecting to an external database

First setup the `master_key` for decrypting rails secrets

* Create a `config.toml` with the following contents

  ```
  [web]
  master_key = "SOME MASTER KEY"
  ```

* Apply the config

  ```bash
  hab config apply supersite.default $(date +%s) config.toml
  ```

## Starting services

```bash
hab svc load will/supersite-db
hab svc load will/supersite --bind database:supersite-db -s at-once
hab svc load will/supersite-web -s at-once
hab svc load will/supersite-worker -s at-once
```

## Accessing the rails console

```bash
hab pkg exec will/supersite rails c
```
