module Tentacles
  class ModelsController < Tentacles::ApplicationController

    before_filter :prepend_klass_path
    helper_method :klass, :klass_name
    helper :application

    def index
      @models = klass.all
      @models = @models.where(params.slice(*klass.column_names))
      @models = @models.page(params[:page] || 1).per(params[:per_page] || 10)
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
      klass_name.split('::').last.tableize.singularize
    end

    def prepend_klass_path
      # lookup_context.prefixes.prepend klass.table_name
      path = "app/views/#{klass.table_name}"
      prepend_view_path([Rails.root.join(path), Tentacles::Engine.root.join(path)])
    end

  end
end