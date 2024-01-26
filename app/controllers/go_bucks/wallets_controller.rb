module GoBucks
  class WalletsController < ::ApplicationController
    include ApplicationHelper

    def show
      authorize Wallet, :show?
      @wallet = Wallet.find_by(user: current_user)
    end

    def create
      authorize Wallet, :create?
      @wallet = Wallet.find_or_create_by(user: current_user)
      render :show
    end
  end
end
