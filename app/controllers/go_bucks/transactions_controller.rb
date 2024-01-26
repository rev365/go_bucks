module GoBucks
  class TransactionsController < ::ApplicationController
    include ApplicationHelper

    before_action :set_wallet

    # GET /go_bucks/transactions
    def index
      @transactions = Transaction.for_wallet(@wallet)
        .paginate(page: params[:page], per_page: 20)
        .includes(to_wallet: :user, from_wallet: :user)
    end

    def create
      @recipient = User.find_by(email: params[:email])
      @transfer = Transfer.to(@recipient, from: current_user)

      if @transfer.(1)
        flash[:error] = @transfer.errors.full_messages.first
      else
        flash[:notice] = "Transfer success"
      end

      redirect_back(fallback_location: { action: "index" })
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wallet
        @wallet = Wallet.find_by(user: current_user)
      end

      def transaction_params
        params.require(:transaction).permit(:amount, :email)
      end
  end
end
