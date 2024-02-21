module GoBucks
  class TransfersController < ::ApplicationController
    include ApplicationHelper

    before_action -> { @users = recipient_scope }

    # GET /go_bucks/transfer
    def show
    end

    # POST /go_bucks/transfer
    def create
      @recipient = recipient_scope.find_by(email: params[:email])
      @transfer = Transfer.to(@recipient, from: current_user)

      if @transfer.(params[:amount])
        flash[:notice] = @transfer.description
        redirect_to go_bucks.transactions_wallet_path
      else
        flash[:error] = @transfer.errors.full_messages.first
        render :show, status: :unprocessable_entity
      end
    end
  end
end
