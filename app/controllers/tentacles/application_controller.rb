module Tentacles
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    layout 'tentacles/application'
  end
end
