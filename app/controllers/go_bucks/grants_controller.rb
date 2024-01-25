module GoBucks
  class GrantsController < ApplicationController
    before_action -> { @selected_wallets = Wallet.where(id: grant_params[:ids]) }

    def show
      @wallets = Wallet.includes(:user).paginate(page: params[:page], per_page: 20)
    end

    def create
      @grants = @selected_wallets.map(&Grant)

      if @grants.all? { |grant| grant.(grant_params[:amount]) }
        flash[:notice] = "Granted #{grant_params[:amount]} to each selected wallet."
      else
        flash[:error] = @grants.detect(&:invalid?).errors.full_messages
      end

      redirect_back(fallback_location: { action: "show" })
    end

    private

      def grant_params
        params.permit(:amount, ids: [])
      end
  end
end
