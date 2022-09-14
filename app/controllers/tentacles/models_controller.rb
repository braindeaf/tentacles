# frozen_string_literal: true
module Tentacles
  class ModelsController < Tentacles::ApplicationController
    around_action :prepend_view_context_prefix
    helper_method :klass
    helper :application

    def index
      @models = klass.all.page(params[:page] || 1).per(params[:per_page] || 10)
    end

    def new
      @model = klass.new
    end

    def show
      @model = klass.find_by(id: params[:id])
    end

    def create
      @model = klass.new(model_params)
      if @model.save
        redirect_to tentacles.model_path(@model.id, klass: klass_name)
      else
        render action: :new
      end
    end

    def edit
      @model = klass.find_by(id: params[:id])
    end

    def update
      @model = klass.find_by(id: params[:id])
      if @model.update_attributes(model_params)
        redirect_to tentacles.model_path(@model.id, klass: klass_name)
      else
        render action: :edit
      end
    end

    def destroy
    end

    private

    def klass
      @klass ||= klass_name.constantize
    end

    def model_params
      params.require(klass_singular_name).permit!
    end

    def klass_name
      params[:klass]
    end

    def klass_singular_name
      klass_name.tableize.singularize
    end

    def prepend_view_context_prefix
      path = "tentacles/#{klass.table_name}"
      lookup_context.prefixes.unshift(path)
      yield
      lookup_context.prefixes.shift
    end
  end
end
