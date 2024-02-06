module GoBucks
  class TransactionsController < ::ApplicationController
    include ApplicationHelper

    # GET /go_bucks/transactions
    def index
      authorize Transaction, :index?

      @transactions = Transaction.order(id: :desc)
        .paginate(page: params[:page], per_page: 20)
        .includes(to_wallet: :user, from_wallet: :user)
    end
  end
end
