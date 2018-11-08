class GoalsController < ApplicationController
  before_action :authenticate_user!
  def index
    ##trae todos los resultados
    @goals= Goal.where(delete_at:[nil])
  end

  def new
    ##crea la instancia para la vista
    @goal=Goal.new
  end

  def create
    @goal=Goal.new(goal_params)
    if @goal.save
      redirect_to goals_url
    else
      render :new
    end
  end

  def edit
    @goal=Goal.find(params[:id])
  end

  def show
    @goal= Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goals_url
    else
      render :edit
    end
  end

  def deletegoal
    ##abre el modal para borrarlo
    @goal=Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to goals_url
    else
      render :edit
    end
  end

  def redirect(url, text)
    redirect_to url, notice: text
  end

  def import
    if params[:file]
      Goal.import(params[:file])
      redirect(configs_path, "Datos guardados éxito!")
    else
      redirect(configs_path, "Por favor seleccionar un archivo CSV")
    end
  end

  ##metodos privados
  private

  def goal_params
    ##parametros permitidos
    params.require(:goal).permit(:name,:number,:description,:avatar)
  end

end
