module GoBucks
  class ChargesController < ApplicationController
    include ApplicationHelper

    before_action -> do
      @recipients = search_recipients.where(id: charge_params[:ids])
           @users = search_recipients.paginate(page: page_param, per_page: 20)
    end

    # GET /go_bucks/charge
    def show
      authorize Charge, :show?
    end

    # POST /go_bucks/charge
    def create
      authorize Charge, :create?

      @charges = @recipients.map(&:wallet).map(&Charge)
        .each { |charge| charge.(charge_params[:amount]) }

      if invalid = @charges.detect(&:invalid?)
        flash[:error] = invalid.errors.full_messages.join('. ')
        render :show, status: :unprocessable_entity
      else
        flash[:notice] = "Charged #{charge_params[:amount]} from #{@charges.size} recipient(s)."
        redirect_back(fallback_location: { action: "show" })
      end
    end

    private

      def search_recipients
        super.joins(:wallet).merge Wallet.where.not(balance: 0)
      end

      def charge_params
        params.permit(:amount, ids: [])
      end
  end
end
