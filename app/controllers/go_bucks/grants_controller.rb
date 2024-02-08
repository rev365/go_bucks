module GoBucks
  class GrantsController < ::ApplicationController
    include ApplicationHelper

    before_action -> do
      @recipients = User.without(current_user).includes(:wallet).where(id: grant_params[:ids])
           @users = User.without(current_user).includes(:wallet).paginate(page: page_param, per_page: 20)
    end

    # GET /go_bucks/grant
    def show
      authorize Grant, :show?
    end

    # POST /go_bucks/grant
    def create
      authorize Grant, :create?

      @grants = @recipients.map(&:wallet).map(&Grant)
        .each { |grant| grant.(grant_params[:amount]) }

      if invalid = @grants.detect(&:invalid?)
        flash[:error] = invalid.errors.full_messages.join('. ')
        render :show, status: :unprocessable_entity
      else
        flash[:notice] = "Granted #{grant_params[:amount]} to #{@grants.size} recipient(s)."
        redirect_back(fallback_location: { action: "show" })
      end
    end

    private

      def grant_params
        params.permit(:amount, ids: [])
      end

      def page_param
        params[:page].presence || 1
      end
  end
end
