class TargetsController < ApplicationController

  def index
    ##trae todas las measures
    @targets= Target.all
  end

  def new
    ##crea la instancia de la unidad de measure
    @target=Target.new
  end

  def edit
    @target=Target.find(params[:id])
  end

  def create
    @target=Target.new(target_params)
    if @target.save
      redirect_to targets_url
    else
      render :new
    end

  end

  def show
    @target= Measure.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def target_params
    ##parametros permitidos
    params.require(:target).permit(:name)
  end

end
