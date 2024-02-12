module GoBucks
  class Engine < ::Rails::Engine
    isolate_namespace GoBucks
    engine_name 'go_bucks'

    config.to_prepare do
      User.include UserDecorator unless User.included_modules.include? UserDecorator
    end
  end
end
