# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'go_bucks', github: 'rev365/go_bucks', ref: '647ca2ac1f615fe2d78d1ec40f92317b17776872'
```

And then execute:
```bash
$ bundle
```

And then install database migrations:
```bash
$ rails go_bucks:install:migrations
```

Run database migrations:
```bash
$ rails db:migrate
```

Add this line to your `config/routes.rb`:
```ruby
mount GoBucks::Engine => "/go-bucks"
```
