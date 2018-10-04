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

    @indicatorvalue=params[:indicador_value]
    @indicatorvalue.each do |ciudad_id,indexciudad|
      indexciudad.each do |indicador_id,valueindicador|

        @objeto= IndicatorValue.where(indicator_id:indicador_id, city_id:ciudad_id )
        if valueindicador!=""
          if @objeto.empty?
            @objeto = IndicatorValue.new(:score => valueindicador, :city_id => ciudad_id, :indicator_id=>null)
            @objeto.save
          else
            @objeto.update(:score => valueindicador, :city_id => ciudad_id, :indicator_id=>indicador_id)
            end
          end
      end
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

  def getvalueindicators

    @cities=City.all
    @indicators= Indicator.all
    @indicatorvalue = IndicatorValue.new

    ###render "getvalueindicators"

  end


  ##metodos privados
  private
  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name, :number, :description, :national_base_line, :year_national_base_line, :national_goal,
                                      :year_national_goal, :reference_value_low, :reference_value_mid, :reference_value_high,
                                      :trazador_conpes, :available, :institutional_inf, :methodological_proposal, :comment,
                                      :target_id, :measure_id)
  end


end
