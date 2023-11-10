FactoryBot.define do
  factory :wallet, class: GoBucks::Wallet do
    balance { 0 }
  end
end
