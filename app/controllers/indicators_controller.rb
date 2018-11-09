class IndicatorsController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todos los indicadores
    @indicators = Indicator.where(delete_at: [nil])
  end

  def new
    ##crea la instancia del indicador
    @indicator = Indicator.new
  end

  def edit
    @indicator = Indicator.find(params[:id])
  end

  def create
    @indicator = Indicator.new(indicator_params)
    respond_to do |format|
      if @indicator.save
        format.html {redirect_to indicators_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "indicators/create"}
        format.js # call create.js.erb on save errors
      end
    end

  end

  def update
    @indicator = Indicator.find(params[:id])
    respond_to do |format|
      if @indicator.update_attributes(indicator_params)
        format.html {redirect_to indicators_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "indicators/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @indicator = Indicator.find(params[:id])
  end


  def deleteindicator
    ##abre el modal para borrarlo
    @indicator = Indicator.find(params[:id])
  end

  def destroy
    @indicator = Indicator.find(params[:id])
    if @indicator.update_attributes(delete_at: DateTime.now.to_datetime)
      redirect_to indicators_url
    else
      render :edit
    end
  end

  def getindicatorstbl
    #retorna la vista con la tabla del index de indicadores
    @indicators = Indicator.joins(:target).where(delete_at: [nil])

    if params[:target] != ""
      @indicators = @indicators.where(:targets => {:id => params[:target]})
    end

    if params[:goal] != ""
      @indicators = @indicators.where(:targets => {:goal_id => params[:goal]})
    end
    render :partial => 'tblindicator'
  end

  ##esto se usa para importar los indicadores via csv
  def import
    if params[:file]
      Indicator.import(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  ##metodos privados

  private

  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name, :number, :description, :national_base_line, :year_national_base_line, :national_goal,
                                      :year_national_goal, :reference_value_low, :reference_value_mid, :reference_value_high,
                                      :trazador_conpes, :available, :institutional_inf, :methodological_proposal, :comment,
                                      :target_id, :measure_id, :trazador_goal)
  end

end
