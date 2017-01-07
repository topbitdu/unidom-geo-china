module Unidom
  module Geo
    module China

      class Engine < ::Rails::Engine

        include Unidom::Common::EngineExtension

        isolate_namespace ::Unidom::Geo::China

        enable_initializer enum_enabled: false, migration_enabled: true

      end

    end
  end
end
