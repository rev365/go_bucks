module GoBucks
  class WalletPolicy
    attr_reader :user

    def initialize(user, _wallet = nil)
      @user = user
    end

    def show?
      true
    end

    def create?
      true
    end
  end
end
