module Admin
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
      @model = klass.create(model_params)
    end

    def edit
      @model = klass.find_by(id: params[:id])
    end

    def update
      @model = klass.find_by(id: params[:id])
      if @model.update_attributes(model_params)
        redirect_to admin.model_path(@model.id, table_name: params[:table_name])
      else
        render action: :edit
      end
    end

    private

    def klass
      @klass ||= klass_name.constantize
    end

    def model_params
      params.require(klass_name.tableize).permit!
    end

    def klass_name
      params[:m]
    end
  end
end