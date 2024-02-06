module GoBucks
  class TransactionPolicy
    attr_reader :user

    def initialize(user, _transaction = nil)
      @user = user
    end

    def index?
      user.admin?
    end
  end
end
