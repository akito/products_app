# README

## Environment
Ruby version: 2.5.1
RoR version : 5.2.0

## How to run the test suite

clone this repository.
```
git clone https://github.com/akitojp/products_app.git
```

bundle install
```
cd products_app
bundle install --path vendor/bundle --jobs=4
```

Database initialization
```
bundle exec rials db:migration
bundle exec rials db:seed
```

Start local server.
```
bundle exec rails server
```
