# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage

To visit GoBucks Wallet:
1. Click “GB$” navigation button near the top right corner.
2. Click “Setup wallet" button to create new wallet.

To visit My Transactions:
1. Visit GoBucks Wallet.
2. Click “My Transactions” link near the header.

To transfer GoBucks credits to another user:
1. Visit My Transactions.
2. Click “Transfer Go Bucks” button.
3. Select a user's wallet.
4. Fill the amount.
5. Click “Transfer” to send.

### For Admins

To fund wallets with GoBucks credits:
1. Visit GoBucks Wallet.
2. Click “Grant Go Bucks” button.
3. Select checkboxes for the recipient wallets
4. Fill the amount.
5. Click “Grant” button.

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'go_bucks', github: 'rev365/go_bucks', ref: '9fe7abeafbdb6987ea20f4fc685ac6f0d9546fb3'
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
