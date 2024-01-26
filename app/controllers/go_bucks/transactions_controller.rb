module GoBucks
  class TransactionsController < ApplicationController
    before_action :set_wallet

    # GET /go_bucks/transactions
    def index
      @transactions = Transaction.for_wallet(@wallet)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_wallet
        @wallet = Wallet.find_by(user: current_user)
      end
  end
end
