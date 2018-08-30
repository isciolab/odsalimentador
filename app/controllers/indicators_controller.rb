class IndicatorsController < ApplicationController

  def index
    ##trae todos los indicadores
    @indicators= Indicator.all
  end

  def new
    ##crea la instancia del indicador
    @indicator=Indicator.new
  end

  def edit
    @indicator=Indicator.find(params[:id])
  end

  def create
    @indicator=Indicator.new(indicator_params)
    if @indicator.save
      redirect_to indicators_url
    else
      render :new
    end

  end

  def show
    @indicator= Indicator.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params

  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name)
  end

end
