module GoBucks
  class Transaction < ::ApplicationRecord
    attr_readonly :amount, :from_wallet_id, :to_wallet_id, :type

    with_options class_name: "GoBucks::Wallet" do
      belongs_to :from_wallet, optional: true
      belongs_to :to_wallet
    end

    scope :for_wallet, ->(wallet) {
      wallet.blank? ? none : where(from_wallet: wallet).or(where(to_wallet: wallet))
    }

    validates :amount, presence: true

    def from_wallet_name
      from_wallet&.user&.name
    end

    def to_wallet_name
      to_wallet&.user&.name
    end

    def self.to_proc
      -> wallet { new(to_wallet: wallet) }
    end
  end
end
