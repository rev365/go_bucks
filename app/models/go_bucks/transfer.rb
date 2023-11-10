module GoBucks
  class Transfer < Struct.new(:from, :to, :amount, :description, keyword_init: true)
    include ActiveModel::Validations
    validates :from, :to, :amount, :description, presence: true

    def save
      return false if invalid?

      @from_wallet = Wallet.find_by(user: from)
      @to_wallet = Wallet.find_by(user: to)

      ActiveRecord::Base.transaction do
        @from_wallet.withdraw(amount)
        @to_wallet.deposit(amount)

        Transaction.create(
          from_wallet: @from_wallet,
          to_wallet: @to_wallet,
          amount: amount,
          description: description
        )
      end

      valid?
    rescue InvalidAmount => invalid
      errors.add(:amount, invalid.message)
      false
    end
  end
end
