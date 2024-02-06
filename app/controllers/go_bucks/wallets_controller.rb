module GoBucks
  class WalletsController < ::ApplicationController
    include ApplicationHelper

    before_action -> { @wallet = Wallet.find_or_create_by(user: current_user) }

    # GET /go_bucks/wallet
    def show
    end

    # POST /go_bucks/wallet
    def create
      redirect_back(fallback_location: { action: "show" })
    end

    # GET /go_bucks/wallet/transactions
    def transactions
      @transactions = Transaction.for_wallet(@wallet)
        .paginate(page: params[:page], per_page: 20)
        .includes(to_wallet: :user, from_wallet: :user)
        .order(id: :desc)

      render :transactions
    end
  end
end
