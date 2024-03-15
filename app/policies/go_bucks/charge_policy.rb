module GoBucks
  class ChargePolicy
    attr_reader :user

    def initialize(user, _charge = nil)
      @user = user
    end

    def show?
      user.admin?
    end

    def create?
      user.admin?
    end
  end
end
