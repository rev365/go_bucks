module GoBucks
  class Transaction < ::ApplicationRecord
    with_options class_name: "GoBucks::Wallet" do
      belongs_to :from_wallet, optional: true
      belongs_to :to_wallet
    end

    scope :for_wallet, ->(wallet) { where(from_wallet: wallet).or where(to_wallet: wallet) }

    validates :amount, presence: true

    def from_wallet_name
      from_wallet&.user&.name
    end

    def to_wallet_name
      to_wallet&.user&.name
    end
  end
end
