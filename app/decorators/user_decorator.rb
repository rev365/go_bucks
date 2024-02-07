User.class_eval do
  has_one :wallet, class_name: "GoBucks::Wallet"
end
