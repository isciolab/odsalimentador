class IndicatorValuesController < ApplicationController
  before_action :authenticate_user!
  def index
    ##trae todos los indicadores
    @indicatorvalues = IndicatorValue.all.order(:date_from)
  end

  def new
    ##crea la instancia del indicador
    @indicatorvalue = IndicatorValue.new
  end

  def editindicator_values
    @indicatorvalue = IndicatorValue.find(params[:id])
  end

  def create

    @indicatorvalue=params[:indicador_value] ##recibe el objeto de la tabla de la vista

    @indicatorvalue.each do |ciudad_id,indexciudad| ##Lo recorro y el primer indice es el de la ciudad

      indexciudad.each do |indicador_id,valueindicador| ##tomo el arreglo de la ciudad y lo recorro, ya que cada ciudad tiene
        # dentro, sus indicadores

        @objeto= IndicatorValue.where(indicator_id:indicador_id, city_id:ciudad_id,date_from:params[:anio])

          if @objeto.empty?
            @objeto = IndicatorValue.new(:score => valueindicador, :city_id => ciudad_id,
                                         :indicator_id=>indicador_id,:date_from=> params[:anio])
            @objeto.save
          else
            @objeto.update(:score => valueindicador, :city_id => ciudad_id,
                           :indicator_id=>indicador_id,:date_from=> params[:anio])
            end

      end
    end
    @cities=City.all
    @indicators= Indicator.all
    @indicatorvalue = IndicatorValue.new
    render 'newindicadorvalue'

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

    @cities=City.where(delete_at: [nil])
    @indicators= Indicator.joins(:target).where(delete_at:[nil])
    @indicatorsvalue = IndicatorValue.joins(:indicator).joins(indicator: :target).where(date_from: params[:anio])

    if params[:target]!=""
      @indicatorsvalue=@indicatorsvalue.where(:targets => {:id=>params[:target]})
      @indicators=@indicators.where(:targets => {:id=>params[:target]})
    end

    if params[:goal]!=""
      @indicatorsvalue=@indicatorsvalue.where(:targets => {:goal_id=>params[:goal]})
      @indicators=@indicators.where(:targets => {:goal_id=>params[:goal]})
    end

    @indicatorvalue = IndicatorValue.new ##para crear el nuevo objeto en el formulario
    render :partial => 'tblnewindicatorvalue'
  end

  def updatefechatoyear
    ##esto es una prueba para cambiarle las fechas a los
    @indicatorvalues = IndicatorValue.all

    @indicatorvalues.each do |indicador|
      puts Date.strptime(indicador.date_from, '%Y')
        @objeto= IndicatorValue.where(id:indicador.id)
        @objeto.update(:date_from => Date.strptime(indicador.date_from, '%Y'))
    end

  end

  def tblindicatorvalue

    @indicatorsvalues = IndicatorValue.joins(:indicator).joins(indicator: :target).where(date_from: params[:anio]).order(:date_from)
    if params[:target]!=""
      @indicatorsvalues=@indicatorsvalues.where(:targets => {:id=>params[:target]})
    end

    if params[:goal]!=""
      @indicatorsvalues=@indicatorsvalues.where(:targets => {:goal_id=>params[:goal]})
    end

    if params[:city]!=""
      @indicatorsvalues=@indicatorsvalues.where(city_id:  params[:city])
    end


    render :partial => 'tblindicatorvalue'
  end

  def importar_indicator_value
    if params[:file]
      IndicatorValue.importarConDosReferen(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  def importar_value_tres_ref
    if params[:file]
      IndicatorValue.importarConTresReferen(params[:file])
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
                                      :target_id, :measure_id)
  end


end
