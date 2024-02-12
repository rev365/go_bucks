module GoBucks
  module UserDecorator
    extend ActiveSupport::Concern

    included do
      has_one :wallet, class_name: "GoBucks::Wallet"
    end
    
    def wallet() = super || build_wallet
    def wallet_balance() = wallet.balance
  end
end
