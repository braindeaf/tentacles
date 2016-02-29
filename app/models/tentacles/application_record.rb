module Tentacles
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
