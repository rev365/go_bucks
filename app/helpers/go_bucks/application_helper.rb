module GoBucks
  module ApplicationHelper
    extend ActiveSupport::Concern

    included do
      url_helpers = Rails.application.routes.url_helpers.public_instance_methods.grep(/_url|_path/)
      delegate *url_helpers, to: :main_app
      helper_method *url_helpers
    end
  end
end
