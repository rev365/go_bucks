# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage

To visit GoBucks Wallet:
1. Click “GB$” navigation button near the top right corner.
2. Click “Setup wallet" button to create new wallet.

To see My Transactions:
1. Visit GoBucks Wallet.
2. Click “My Transactions” link near the header.

### For Admins

To see All Transactions:
1. Visit GoBucks Wallet.
2. Click “All Transactions” link near the header.

To fund wallets with GoBucks credits:
1. See All Transactions.
2. Click “Grant Go Bucks” button.
3. Check checkboxes of recipients.
4. Fill the amount.
5. Click “Grant” button.

To charge wallets:
1. See All Transactions.
2. Click “Grant Go Bucks” button.
3. Click "Charge" button of recipients.
4. Fill the amount.
5. Click "Charge" button.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'go_bucks', github: 'rev365/go_bucks', ref: 'e5d2d81f17f167b7b9f034ae3292b9014b5a5d19'
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

Generate pundit policies:
```bash
$ rails g pundit:policy go_bucks/recipient
$ rails g pundit:policy go_bucks/transaction
$ rails g pundit:policy go_bucks/grant
$ rails g pundit:policy go_bucks/charge
```
