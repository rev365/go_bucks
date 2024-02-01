module GoBucks
  class GrantsController < ::ApplicationController
    include ApplicationHelper

    before_action -> { @recipients = User.without(current_user).where(id: grant_params[:ids]) }

    def show
      authorize Grant, :show?
      @wallet_for = Wallet.includes(:user).index_by(&:user)
      @users = User.without(current_user).paginate(page: params[:page], per_page: 20)
    end

    def create
      authorize Grant, :create?
      @wallet_for = Wallet.includes(:user).index_by(&:user)
      @grants = @recipients
        .map {|user| @wallet_for[user] || Wallet.new(user: user) }
        .map(&Grant)
        .each { |grant| grant.(grant_params[:amount]) }

      if invalid = @grants.detect(&:invalid?)
        flash[:error] = invalid.errors.full_messages.join('. ')
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
