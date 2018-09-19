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

  def update
    @indicator = Indicator.find(params[:id])
    if @indicator.update_attributes(indicator_params)
      redirect_to indicators_url
    else
      render 'edit'
    end
  end

  def show
    @indicator= Indicator.find(params[:id])
  end

  def filter_targets_by_goals
    @filtered_units = Target.where(goal_id: params[:selected_goal])
  end

  ##metodos privados
  private

  ##nombre del modelo _params

  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name,:number,:description,:national_base_line,:year_national_base_line,:national_goal,
                                      :year_national_goal,:reference_value_low,:reference_value_mid,:reference_value_high,
                                      :trazador_conpes,:available,:institutional_inf,:methodological_proposal,:comment,
                                      :target_id,:measure_id)
  end

end
