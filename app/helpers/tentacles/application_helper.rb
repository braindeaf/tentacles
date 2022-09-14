# frozen_string_literal: true
module Tentacles
  module ApplicationHelper
    def model_path(model, options = {})
      super(model.id, options.merge(m: model.class.name))
    end
  end
end
