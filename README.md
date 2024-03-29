# GoBucks
New internal incentive program to offer points to employees redeemable on “GoMarket”

## Usage

To visit GoBucks Wallet:
1. Click “GB$” navigation button near the top right corner.
2. Click “Setup wallet" button to create new wallet.

To see My Transactions:
1. Visit GoBucks Wallet.
2. Click “My Transactions” link near the header.

To transfer GoBucks credits to another user:
1. See My Transactions.
2. Click “Transfer Go Bucks” button.
3. Select a recipient.
4. Fill the amount.
5. Click “Transfer” to send.

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

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'go_bucks', github: 'rev365/go_bucks', ref: '30e0fb14e459abb426c152bf6cfba855f0f64069'
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
```
