module GoBucks
  class Engine < ::Rails::Engine
    isolate_namespace GoBucks
    engine_name 'go_bucks'

    config.to_prepare do
      Dir.glob(Engine.root.join("app", "decorators", "**", "*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end
  end
end
