# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'go_bucks', github: 'rev365/go_bucks', ref: '86b2d6368f3c9c33ac336614773c61da3dcf99aa'
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
