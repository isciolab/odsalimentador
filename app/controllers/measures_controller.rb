class MeasuresController < ApplicationController

  def index
    ##trae todas las measures
    @measures= Measure.all
  end

  def new
    ##crea la instancia de la unidad de measure
    @measure=Measure.new
  end

  def edit
    @measure=Measure.find(params[:id])
  end

  def create
    @measure=Measure.new(measure_params)
    if @measure.save
    redirect_to measures_url
  else
    render :new
  end

  end

  def show
    @measure= Measure.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def measure_params
    ##parametros permitidos
    params.require(:measure).permit(:name)
  end

end
