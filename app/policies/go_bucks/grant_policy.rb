module GoBucks
  class GrantPolicy
    attr_reader :user, :grant

    def initialize(user, grant)
      @user = user
      @grant = grant
    end

    def show?
      user.admin?
    end

    def create?
      user.admin?
    end
  end
end
