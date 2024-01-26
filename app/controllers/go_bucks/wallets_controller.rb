module GoBucks
  class WalletsController < ::ApplicationController
    include ApplicationHelper

    def show
      @wallet = Wallet.find_by(user: current_user)
    end

    def create
      @wallet = Wallet.find_or_create_by(user: current_user)
      redirect_back(fallback_location: { action: "show" })
    end
  end
end
