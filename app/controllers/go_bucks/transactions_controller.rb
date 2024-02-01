module GoBucks
  class TransactionsController < ::ApplicationController
    include ApplicationHelper

    before_action :set_wallet, only: [:index]

    # GET /go_bucks/transactions
    def index
      @transactions = Transaction.for_wallet(@wallet)
        .paginate(page: params[:page], per_page: 20)
        .includes(to_wallet: :user, from_wallet: :user)
        .order(id: :desc)
    end

    # GET /go_bucks/transactions/new
    def new
      @users = User.without(current_user)
    end

    # POST /go_bucks/transactions
    def create
      @recipient = User.without(current_user).find_by!(email: params[:email])
      @transfer = Transfer.to(@recipient, from: current_user)

      if @transfer.(params[:amount])
        redirect_to go_bucks.transactions_path, flash: { notice: "Transfered #{params[:amount]} to #{@recipient.name}" }
      else
        redirect_to go_bucks.transactions_path, flash: { error: @transfer.errors.full_messages.first }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wallet
        @wallet = Wallet.find_by(user: current_user)
      end
  end
end
