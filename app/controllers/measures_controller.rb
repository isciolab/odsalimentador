class MeasuresController < ApplicationController
  before_action :authenticate_user!
  def index
    ##trae todas las measures
    @measures= Measure.where(delete_at:[nil])
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

  def update
    @measure = Measure.find(params[:id])
    if @measure.update_attributes(measure_params)
      redirect_to measures_url
    else
      render 'edit'
    end
  end

  def show
    @measure= Measure.find(params[:id])
  end

  def deletemeasure
    ##abre el modal para borrarlo
    @measure=Measure.find(params[:id])
  end

  def destroy
    @measure = Measure.find(params[:id])
    if @measure.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to measures_url
    else
      render :edit
    end
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def measure_params
    ##parametros permitidos
    params.require(:measure).permit(:name)
  end

end
