module Tentacles
  class ModelsController < ApplicationController
    helper :application
    def index
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
        redirect_to tentacles.model_path(@model.id, m: klass_name)
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
        redirect_to tentacles.model_path(@model.id, m: klass_name)
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
      params[:m]
    end

    def klass_singular_name
      klass_name.tableize.singularize
    end
  end
end