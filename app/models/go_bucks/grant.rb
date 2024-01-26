module GoBucks
  class Grant < Transaction
    def call(amount)
      ActiveRecord::Base.transaction do
        update(
          amount: amount,
          description: "Granted #{amount} to #{to_wallet.user_name}"
        )

        to_wallet.deposit(self.amount)
      end

      valid?
    rescue InvalidAmount => invalid
      errors.add(:amount, invalid.message)
      false
    end
  end
end
