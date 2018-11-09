class MeasuresController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todas las measures
    @measures = Measure.where(delete_at: [nil])
  end

  def new
    ##crea la instancia de la unidad de measure
    @measure = Measure.new
  end

  def edit
    @measure = Measure.find(params[:id])
  end

  def create
    @measure = Measure.new(measure_params)
    respond_to do |format|
      if @measure.save
        format.html {redirect_to measures_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "measures/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def update
    @measure = Measure.find(params[:id])
    respond_to do |format|
      if @measure.update_attributes(measure_params)
        format.html {redirect_to measures_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "measures/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @measure = Measure.find(params[:id])
  end

  def deletemeasure
    ##abre el modal para borrarlo
    @measure = Measure.find(params[:id])
  end

  def destroy
    @measure = Measure.find(params[:id])
    if @measure.update_attributes(delete_at: DateTime.now.to_datetime)
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
