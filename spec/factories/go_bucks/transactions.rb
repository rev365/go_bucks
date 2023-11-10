FactoryBot.define do
  factory :transaction, class: GoBucks::Transaction do
    amount { 0 }
  end
end
