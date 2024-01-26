module GoBucks
  class GrantPolicy
    attr_reader :user

    def initialize(user, _grant = nil)
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
