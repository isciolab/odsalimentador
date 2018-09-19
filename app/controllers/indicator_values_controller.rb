class IndicatorValuesController < ApplicationController

  def index
    ##trae todos los indicadores
    @indicatorvalues = IndicatorValue.all
    @cities=City.all
  end

  def new
    ##crea la instancia del indicador
    @indicatorvalue = IndicatorValue.new
  end

  def edit
    @indicatorvalue = IndicatorValue.find(params[:id])
  end

  def create
    @indicatorvalue = IndicatorValue.new(indicator_params)
    if @indicatorvalue.save
      redirect_to indicators_url
    else
      render :new
    end

  end

  def update
    @indicatorvalue = Indicator.find(params[:id])
    if @indicatorvalue.update_attributes(indicator_params)
      redirect_to indicators_url
    else
      render 'edit'
    end
  end

  def show
    @indicatorvalue = IndicatorValue.find(params[:id])
  end

  def newindicadorvalue
    @cities=City.all
    @indicators= Indicator.all
    @indicatorvalue = IndicatorValue.new
  end


  ##metodos privados
  private

  ##nombre del modelo _params

  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name, :number, :description, :national_base_line, :year_national_base_line, :national_goal,
                                      :year_national_goal, :reference_value_low, :reference_value_mid, :reference_value_high,
                                      :trazador_conpes, :available, :institutional_inf, :methodological_proposal, :comment,
                                      :target_id, :measure_id)
  end


end
