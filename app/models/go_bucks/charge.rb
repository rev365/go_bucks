module GoBucks
  class Charge < Transaction
    def call(amount)
      ActiveRecord::Base.transaction do
        if update(
            amount: amount,
            description: "Charged #{amount} from #{to_wallet&.user_name}"
          )

          to_wallet.withdraw(self.amount)
        end
      end

      valid?
    rescue InvalidAmount => invalid
      errors.add(:amount, invalid.message)
      false
    end
  end
end
