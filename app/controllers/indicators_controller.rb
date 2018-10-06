class IndicatorsController < ApplicationController

  def index
    ##trae todos los indicadores
    @indicators= Indicator.where(delete_at:[nil])
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



  def deleteindicator
    ##abre el modal para borrarlo
    @indicator=Indicator.find(params[:id])
  end

  def destroy
    @indicator = Indicator.find(params[:id])
    if @indicator.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to indicators_url
    else
      render :edit
    end
  end

  ##metodos privados
  private
  def indicator_params

    ##parametros permitidos
    params.require(:indicator).permit(:name,:number,:description,:national_base_line,:year_national_base_line,:national_goal,
                                      :year_national_goal,:reference_value_low,:reference_value_mid,:reference_value_high,
                                      :trazador_conpes,:available,:institutional_inf,:methodological_proposal,:comment,
                                      :target_id,:measure_id,:trazador_goal)
  end

end
