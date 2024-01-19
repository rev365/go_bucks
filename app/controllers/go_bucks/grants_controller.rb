module GoBucks
  class GrantsController < ApplicationController
    before_action -> { @grant = Grant.new(grant_params) }

    def show
      @wallets = Wallet.paginate(page: params[:page], per_page: 20)
    end

    def create
      if @grant.save
        flash[:notice] = "Granted #{@grant.amount} to each selected wallet."
      else
        flash[:error] = @grant.errors.full_messages
      end

      redirect_back(fallback_location: { action: "show" })
    end

    def grant_params
      params.permit(:amount, ids: [])
    end
  end
end
