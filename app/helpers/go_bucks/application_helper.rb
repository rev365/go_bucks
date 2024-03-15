module GoBucks
  module ApplicationHelper
    extend ActiveSupport::Concern

    included do
      url_helpers = Rails.application.routes.url_helpers.public_instance_methods.grep(/_url|_path/)
      delegate *url_helpers, to: :main_app
      helper_method *url_helpers
    end

    private

      def recipient_scope
        policy_scope(User, policy_scope_class: GoBucks::RecipientPolicy::Scope)
          .without(current_user)
          .includes(:wallet)
      end

      def search_recipients
        return recipient_scope if params[:q].blank?

        recipient_scope.search(params[:q])
      end

      def page_param
        params[:page].presence || 1
      end
  end
end
