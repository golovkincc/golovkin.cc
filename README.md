# golovkin.cc

My personal Ruby app using the [Rails](http://rubyonrails.org) framework.

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org), [Bundler](http://bundler.io) installed.

```sh
git clone git@github.com:golovkincc/golovkin.cc.git # or clone your own fork
cd golovkin.cc
bundle update
rails s
```

Your app should now be running on [localhost:3000](http://localhost:3000/).

## Creating dokku app

```
dokku apps:create golovkin.cc
dokku postgres:create golovkin
dokku postgres:link golovkin golovkin.cc
```

## Creating dev dokku app

```
dokku apps:create dev.golovkin.cc
dokku postgres:create dev.golovkin
dokku postgres:link dev.golovkin dev.golovkin.cc
```

## Deploying to Dokku

```
git remote add dokku/master dokku@golovkin.cc:golovkin.cc
git push dokku/master master
```

## Deploying to dev Dokku

```
git remote add dokku/dev dokku@golovkin.cc:dev.golovkin.cc
git push dokku/dev dev:master
```

## Documentation

For more information about using Dokku, see these Dev Center articles:

- [Getting Started with Dokku](http://dokku.viewdocs.io/dokku/getting-started/installation/)

## ActiveAdmin

- [Getting Started with ActiveAdmin](http://activeadmin.info/docs/documentation.html)

```
# create db
rails generate active_admin:install
rake db:migrate
rake db:seed

# User: admin@example.com
# Password: password
```

To register your first model, run:

```
rails generate active_admin:resource [MyModelName]
```