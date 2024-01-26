module GoBucks
  module ApplicationHelper
    extend ActiveSupport::Concern

    included do
      Rails.application.routes.url_helpers.public_instance_methods.grep(/_url|_path/).each do |name|
        delegate name, to: :main_app
        helper_method name
      end
    end
  end
end
