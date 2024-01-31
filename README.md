# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage

To visit GoBucks Wallet:
1. Click “GB$” navigation button near the top right corner.
2. Click “Setup wallet" button to create new wallet.

To list current user GoBucks transactions:
1. Click “My Transactions” link near the header.

To transfer GoBucks credits to another user:
1. Click “Transfer Go Bucks” button.
2. Select a user's wallet.
3. Fill the amount.
4. Click “Transfer” to send.

### For Admins

To fund wallets with GoBucks credits:
1. Click “Grant Go Bucks” button.
2. Select checkboxes for the recipient wallets
3. Fill the amount.
4. Click “Grant” button.

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
