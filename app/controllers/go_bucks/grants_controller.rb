module GoBucks
  class GrantsController < ::ApplicationController
    include ApplicationHelper

    before_action -> { @selected_wallets = Wallet.except_user(current_user).where(id: grant_params[:ids]) }

    def show
      authorize Grant, :show?
      @wallets = Wallet.includes(:user).except_user(current_user).paginate(page: params[:page], per_page: 20)
    end

    def create
      authorize Grant, :create?
      @grants = @selected_wallets.map(&Grant)

      if @grants.none? { |grant| grant.(grant_params[:amount]) }
        flash[:error] = @grants.detect(&:invalid?).errors.full_messages.join('. ')
      else
        flash[:notice] = "Granted #{grant_params[:amount]} to each selected wallet."
      end

      redirect_back(fallback_location: { action: "show" })
    end

    private

      def grant_params
        params.permit(:amount, ids: [])
      end
  end
end
