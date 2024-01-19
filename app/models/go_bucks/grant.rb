module GoBucks
  class Grant
    include ActiveModel::Model
    include ActiveModel::Attributes
    include ActiveModel::Validations

    attribute :amount, :integer, default: 0
    attribute :ids, array: true, default: []

    validates :ids, :amount, presence: true

    def include?(id) = [*ids].map(&:to_i).include?(id.to_i)

    def save
      return false if invalid?

      @wallets = Wallet.includes(:user).where(id: ids)

      @wallets.each do |wallet|
        ActiveRecord::Base.transaction do
          wallet.deposit(amount)

          Transaction.create(
            to_wallet: wallet,
            amount: amount,
            description: "Granted #{amount} GoBucks credits to #{wallet.user_name}"
          )
        end
      end

      valid?
    rescue InvalidAmount => invalid
      errors.add(:amount, invalid.message)
      false
    end
  end
end