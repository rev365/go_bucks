module GoBucks
  class Transfer < Transaction
    def call(amount)
      ActiveRecord::Base.transaction do
        if update(
            amount: amount,
            description: "Transfered #{amount} to #{to_wallet&.user_name} from #{from_wallet&.user_name}"
          )

          from_wallet.withdraw(self.amount)
          to_wallet.deposit(self.amount)
        end
      end

      valid?
    rescue InvalidAmount => invalid
      errors.add(:amount, invalid.message)
      false
    end

    def self.to(user, from:)
      from_wallet = Wallet.find_by(user: from)
      to_wallet = Wallet.find_or_create_by(user: user)
        
      new(to_wallet: to_wallet, from_wallet: from_wallet)
    end
  end
end
