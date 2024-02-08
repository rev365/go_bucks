User.class_eval do
  has_one :wallet, class_name: "GoBucks::Wallet"

  def wallet() = super || build_wallet
  def wallet_balance() = wallet.balance
end
