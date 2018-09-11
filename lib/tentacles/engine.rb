module Tentacles
  class Engine < ::Rails::Engine
    # isolate_namespace Tentacles
    engine_name 'tentacles'
    require 'kaminari_route_prefix'
  end
end
