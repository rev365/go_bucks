module GoBucks
  class Wallet < ::ApplicationRecord
    attr_readonly :balance
    belongs_to :user

    def deposit(amount)
      raise InvalidAmount, "Given #{amount} is below zero." if amount < 0

      Wallet.update_counters(id, balance: amount)
      increment(:balance, amount)
    end

    def withdraw(amount)
      Wallet.update_counters(id, balance: -amount)
      decrement(:balance, amount)
    rescue ActiveRecord::StatementInvalid
      raise InvalidAmount, "Not enough balance."
    end

    delegate :name, to: :user, prefix: true
  end
end
