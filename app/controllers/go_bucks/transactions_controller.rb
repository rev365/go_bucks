module GoBucks
  class TransactionsController < ::ApplicationController
    include ApplicationHelper

    before_action :set_wallet

    # GET /go_bucks/transactions
    def index
      @transactions = Transaction.for_wallet(@wallet)
        .paginate(page: params[:page], per_page: 20)
        .includes(to_wallet: :user, from_wallet: :user)
        .order(id: :desc)
    end

    # GET /go_bucks/transactions/new
    def new
      @wallets = Wallet.without(@wallet)
    end

    # POST /go_bucks/transactions
    def create
      @recipient = User.find_by(email: params[:email])
      @transfer = Transfer.to(@recipient, from: current_user)

      if @transfer.(params[:amount])
        flash[:error] = @transfer.errors.full_messages.first
      else
        flash[:notice] = "Transfer success"
      end

      redirect_to go_bucks.transactions_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wallet
        @wallet = Wallet.find_by(user: current_user)
      end
  end
end
