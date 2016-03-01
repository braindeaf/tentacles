module Tentacles
  module ModelDecorator
    extend ActiveSupport::Concern

    module ClassMethods
      def accessors
        column_names.except('id','created_at','updated_at')
      end
    end

  end
end